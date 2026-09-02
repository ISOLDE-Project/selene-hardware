import numpy as np
import cv2
import glob
import time
import os
import re

FRAME_DIR = "/home/uic18097/isolde/git/selene/selene-hardware/stream_test"
HEIGHT, WIDTH, CHANNELS = 224, 56, 4
FRAME_SIZE = 224 * 224  # = 50176
DISPLAY_SIZE = 600

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
        
        # Direct reshape - 224x224 single channel grayscale
        gray = np.frombuffer(data, dtype=np.uint8).reshape((224, 224))
        
        # Contrast stretch
        mn, mx = gray.min(), gray.max()
        if mx > mn:
            gray = ((gray.astype(np.float32) - mn) / (mx - mn) * 255).astype(np.uint8)
        return gray
    except:
        return None


last_idx = -1
frame_counter = 0

# Create window ONCE and never destroy it until quit
cv2.namedWindow("Live Frame", cv2.WINDOW_AUTOSIZE)

# Show placeholder while waiting
placeholder = np.zeros((DISPLAY_SIZE, DISPLAY_SIZE), dtype=np.uint8)
cv2.putText(placeholder, "Waiting for frames...", (50, 400),
            cv2.FONT_HERSHEY_SIMPLEX, 1.0, 255, 2)
cv2.imshow("Live Frame", placeholder)

print("[Viewer] Watching... Press 'q' to quit")

try:
    while True:
        # Always call waitKey to keep window responsive
        key = cv2.waitKey(30) & 0xFF
        if key == ord('q'):
            break

        files = sorted(glob.glob(os.path.join(FRAME_DIR, "frame_*.bin")),
                       key=get_frame_index)
        new_files = [f for f in files if get_frame_index(f) > last_idx]

        if not new_files:
            continue

        # Take latest frame, skip stale ones
        filepath = new_files[-1]
        idx = get_frame_index(filepath)
        time.sleep(0.03)  # Let file finish writing

        gray = load_frame(filepath)
        if gray is None:
            continue

        frame_counter += 1
        last_idx = idx

        # Build display
        display = cv2.cvtColor(gray, cv2.COLOR_GRAY2BGR)
        display = cv2.resize(display, (DISPLAY_SIZE, DISPLAY_SIZE),
                             interpolation=cv2.INTER_NEAREST)
        #cv2.putText(display, f"Frame: {frame_counter}", (20, 60),
        #            cv2.FONT_HERSHEY_SIMPLEX, 2.0, (0, 255, 0), 3)

        # Update existing window - no destroy/recreate
        cv2.imshow("Live Frame", display)
        print(f"[Viewer] frame_{idx:04d}.bin → display #{frame_counter}")

except KeyboardInterrupt:
    pass
finally:
    cv2.destroyAllWindows()
    print(f"[Viewer] Done. Showed {frame_counter} frames.")










'''
import numpy as np
import cv2
import glob
import time
import os
import re

FRAME_DIR = "/home/uic18097/isolde/git/selene/selene-hardware/stream_test"
HEIGHT, WIDTH, CHANNELS = 224, 56, 4
FRAME_SIZE = HEIGHT * WIDTH * CHANNELS
DISPLAY_SIZE = 400

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
        gray = np.frombuffer(data, dtype=np.uint8).reshape((HEIGHT, WIDTH, CHANNELS))
        gray = gray.reshape((224, 224))
        mn, mx = gray.min(), gray.max()
        if mx > mn:
            gray = ((gray.astype(np.float32) - mn) / (mx - mn) * 255).astype(np.uint8)
        return gray
    except:
        return None

last_idx = -1
frame_counter = 0

# Create window ONCE and never destroy it until quit
cv2.namedWindow("Live Frame", cv2.WINDOW_AUTOSIZE)

# Show placeholder while waiting
placeholder = np.zeros((DISPLAY_SIZE, DISPLAY_SIZE), dtype=np.uint8)
cv2.putText(placeholder, "Waiting for frames...", (50, 400),
            cv2.FONT_HERSHEY_SIMPLEX, 1.0, 255, 2)
cv2.imshow("Live Frame", placeholder)

print("[Viewer] Watching... Press 'q' to quit")

try:
    while True:
        # Always call waitKey to keep window responsive
        key = cv2.waitKey(30) & 0xFF
        if key == ord('q'):
            break

        files = sorted(glob.glob(os.path.join(FRAME_DIR, "frame_*.bin")),
                       key=get_frame_index)
        new_files = [f for f in files if get_frame_index(f) > last_idx]

        if not new_files:
            continue

        # Take latest frame, skip stale ones
        filepath = new_files[-1]
        idx = get_frame_index(filepath)
        time.sleep(0.03)  # Let file finish writing

        gray = load_frame(filepath)
        if gray is None:
            continue

        frame_counter += 1
        last_idx = idx

        # Build display
        display = cv2.cvtColor(gray, cv2.COLOR_GRAY2BGR)
        display = cv2.resize(display, (DISPLAY_SIZE, DISPLAY_SIZE),
                             interpolation=cv2.INTER_NEAREST)
        cv2.putText(display, f"Frame: {frame_counter}", (20, 60),
                    cv2.FONT_HERSHEY_SIMPLEX, 2.0, (0, 255, 0), 3)

        # Update existing window - no destroy/recreate
        cv2.imshow("Live Frame", display)
        print(f"[Viewer] frame_{idx:04d}.bin → display #{frame_counter}")

except KeyboardInterrupt:
    pass
finally:
    cv2.destroyAllWindows()
    print(f"[Viewer] Done. Showed {frame_counter} frames.")
'''









'''
import numpy as np
import cv2
import glob
import time
import os
import re
import matplotlib.pyplot as plt

FRAME_DIR = "/home/uic18097/isolde/git/selene/selene-hardware/stream_test"
HEIGHT, WIDTH, CHANNELS = 224, 56, 4
FRAME_SIZE = HEIGHT * WIDTH * CHANNELS

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
        gray = np.frombuffer(data, dtype=np.uint8).reshape((HEIGHT, WIDTH, CHANNELS))
        gray = gray.reshape((224, 224)).astype(np.float32)
        # Contrast stretch
        mn, mx = gray.min(), gray.max()
        if mx > mn:
            gray = (gray - mn) / (mx - mn) * 255
        return gray.astype(np.uint8)
    except:
        return None

plt.ion()
fig, ax = plt.subplots(figsize=(8, 8))
ax.axis('off')

# Start with noise so we can SEE if it updates
dummy = np.random.randint(0, 255, (224, 224), dtype=np.uint8)
im = ax.imshow(dummy, cmap='gray', vmin=0, vmax=255)
txt = ax.set_title("Waiting...", fontsize=16)

# Big frame counter text ON the image itself
text_overlay = ax.text(10, 210, "Frame: 0",
                        color='lime', fontsize=20, fontweight='bold',
                        bbox=dict(facecolor='black', alpha=0.7))

plt.tight_layout()
fig.canvas.draw()
plt.pause(0.1)

last_idx = -1
frame_counter = 0

print("[Viewer] Watching... Close window or Ctrl+C to quit")

try:
    while plt.fignum_exists(fig.number):
        files = sorted(glob.glob(os.path.join(FRAME_DIR, "frame_*.bin")),
                       key=get_frame_index)
        new_files = [f for f in files if get_frame_index(f) > last_idx]

        if new_files:
            filepath = new_files[-1]
            idx = get_frame_index(filepath)
            time.sleep(0.05)  # Let file finish writing

            gray = load_frame(filepath)
            if gray is not None:
                frame_counter += 1
                last_idx = idx

                # Burn frame number into the pixel data itself
                gray_bgr = cv2.cvtColor(gray, cv2.COLOR_GRAY2BGR)
                cv2.putText(gray_bgr,
                            f"F:{frame_counter}",
                            (5, 40),
                            cv2.FONT_HERSHEY_SIMPLEX,
                            1.5, (0, 255, 0), 3)
                gray_display = cv2.cvtColor(gray_bgr, cv2.COLOR_BGR2GRAY)

                im.set_data(gray_display)
                txt.set_text(f"Frame: {frame_counter}  |  idx: {idx}")
                text_overlay.set_text(f"Frame: {frame_counter}")

                fig.canvas.draw()
                fig.canvas.flush_events()
                print(f"[Viewer] Showing frame_{idx:04d}.bin  (display #{frame_counter})")

        plt.pause(0.05)

except KeyboardInterrupt:
    pass
finally:
    plt.ioff()
    plt.close()
    print(f"[Viewer] Done. Showed {frame_counter} frames.")
'''

