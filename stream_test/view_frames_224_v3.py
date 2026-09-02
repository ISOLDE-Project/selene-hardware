import numpy as np
import cv2
import glob
import time
import os
import re
import threading
import serial

FRAME_DIR = "/home/uic18097/isolde/git/selene/selene-hardware/stream_test"
HEIGHT, WIDTH, CHANNELS = 224, 56, 4
FRAME_SIZE = 224 * 224  # = 50176
DISPLAY_SIZE = 600

SERIAL_PORT = "/dev/ttyUSB1"
BAUD_RATE = 115200

# ── Shared state between threads ──────────────────────────────────────────────
current_name = ""
current_similarity = ""
name_lock = threading.Lock()

def uart_reader():
    """Background thread: read UART and update current_name."""
    global current_name, current_similarity
    while True:
        try:
            with serial.Serial(SERIAL_PORT, BAUD_RATE, timeout=1) as ser:
                print(f"[UART] Connected to {SERIAL_PORT} @ {BAUD_RATE}")
                while True:
                    line = ser.readline().decode("utf-8", errors="ignore").strip()
                    if not line:
                        continue
                    # Match:  >>> Best match       : Name
                    match = re.search(r'>>>\s*Best match\s*:\s*(.+)', line)
                    if match:
                        name = match.group(1).strip()
                        with name_lock:
                            current_name = name
                        print(f"[UART] Name → {name}")
                    # NEW: parse similarity
                    sim_match = re.search(r'>>>\s*Similarity\s*:\s*(\d+)/1000', line)
                    if sim_match:
                        pct = int(sim_match.group(1)) / 10  # e.g. 381 → 38.1
                        with name_lock:
                            current_similarity = f"{pct:.1f}%"
                        print(f"[UART] Similarity → {pct:.1f}%")
        except serial.SerialException as e:
            print(f"[UART] Error: {e} — retrying in 2s...")
            time.sleep(2)
        except Exception as e:
            print(f"[UART] Unexpected error: {e} — retrying in 2s...")
            time.sleep(2)

# ── Helpers ───────────────────────────────────────────────────────────────────
def get_frame_index(filepath):
    match = re.search(r'frame_(\d+)\.bin', filepath)
    return int(match.group(1)) if match else -1

def load_frame(filepath):
    try:
        if os.path.getsize(filepath) != FRAME_SIZE:
            return None
        with open(filepath, "rb") as f:
            data = f.read()
        if len(data) != FRAME_SIZE:
            return None

        gray = np.frombuffer(data, dtype=np.uint8).reshape((224, 224))

        # Contrast stretch
        mn, mx = gray.min(), gray.max()
        if mx > mn:
            gray = ((gray.astype(np.float32) - mn) / (mx - mn) * 255).astype(np.uint8)
        return gray
    except:
        return None

def draw_name_overlay(frame, name, similarity=""):
    if not name:
        return frame

    if name == "No Person":
        label = "ID: Unknown"
        color = (0, 0, 255)    # red
    else:
        label = f"ID: {name} ({similarity})" if similarity else f"ID: {name}"
        color = (0, 230, 0)    # green

    font       = cv2.FONT_HERSHEY_DUPLEX
    font_scale = 1.6
    thickness  = 3
    padding    = 16

    (text_w, text_h), baseline = cv2.getTextSize(label, font, font_scale, thickness)

    banner_h = text_h + baseline + padding * 2
    overlay  = frame.copy()
    cv2.rectangle(overlay,
                  (0, DISPLAY_SIZE - banner_h),
                  (DISPLAY_SIZE, DISPLAY_SIZE),
                  (0, 0, 0), cv2.FILLED)
    cv2.addWeighted(overlay, 0.55, frame, 0.45, 0, frame)

    text_x = (DISPLAY_SIZE - text_w) // 2
    text_y = DISPLAY_SIZE - padding - baseline
    cv2.putText(frame, label, (text_x, text_y),
                font, font_scale, color, thickness, cv2.LINE_AA)
    return frame


# ── Start UART thread ─────────────────────────────────────────────────────────
t = threading.Thread(target=uart_reader, daemon=True)
t.start()

# ── Main viewer loop ──────────────────────────────────────────────────────────
last_idx = -1
frame_counter = 0

cv2.namedWindow("Live Frame", cv2.WINDOW_AUTOSIZE)

placeholder = np.zeros((DISPLAY_SIZE, DISPLAY_SIZE, 3), dtype=np.uint8)
cv2.putText(placeholder, "Waiting for frames...", (50, 400),
            cv2.FONT_HERSHEY_SIMPLEX, 1.0, (255, 255, 255), 2)
cv2.imshow("Live Frame", placeholder)

print("[Viewer] Watching... Press 'q' to quit")

try:
    while True:
        key = cv2.waitKey(30) & 0xFF
        if key == ord('q'):
            break

        files = sorted(glob.glob(os.path.join(FRAME_DIR, "frame_*.bin")),
                       key=get_frame_index)
        new_files = [f for f in files if get_frame_index(f) > last_idx]

        if not new_files:
            continue

        filepath = new_files[-1]
        idx = get_frame_index(filepath)
        time.sleep(0.03)  # Let file finish writing

        gray = load_frame(filepath)
        if gray is None:
            continue

        frame_counter += 1
        last_idx = idx

        # Build colour display frame
        display = cv2.cvtColor(gray, cv2.COLOR_GRAY2BGR)
        display = cv2.resize(display, (DISPLAY_SIZE, DISPLAY_SIZE),
                             interpolation=cv2.INTER_NEAREST)

        # Overlay current recognised name (thread-safe read)
        with name_lock:
            name_snapshot = current_name
            sim_snapshot  = current_similarity

        display = draw_name_overlay(display, name_snapshot, sim_snapshot)

        cv2.imshow("Live Frame", display)
        print(f"[Viewer] frame_{idx:04d}.bin → display #{frame_counter}  |  ID: {name_snapshot or '—'} ({sim_snapshot})")

except KeyboardInterrupt:
    pass
finally:
    cv2.destroyAllWindows()
    print(f"[Viewer] Done. Showed {frame_counter} frames.")

