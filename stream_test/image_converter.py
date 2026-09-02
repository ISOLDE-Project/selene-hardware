import numpy as np
from PIL import Image
import glob
import os
import sys

# ── Configuration ──────────────────────────────────────────────────────────────
WIDTH_WORDS = 56    # uint32 words per row
HEIGHT      = 224   # rows
PIXEL_W     = 224   # unpacked pixel width  (WIDTH_WORDS * 4)
EXPECTED    = HEIGHT * WIDTH_WORDS * 4  # 50 176 bytes
# ──────────────────────────────────────────────────────────────────────────────

def bin_to_png(bin_path: str) -> bool:
    """
    Convert a single .bin frame file to a grayscale .png.
    Returns True on success, False if the file is skipped.
    """
    raw = np.fromfile(bin_path, dtype=np.uint8)

    if len(raw) != EXPECTED:
        print(f"  [SKIP] {bin_path}\n"
              f"         wrong size: {len(raw)} bytes (expected {EXPECTED})")
        return False

    frame    = raw.view(dtype=np.uint32).reshape(HEIGHT, WIDTH_WORDS)
    unpacked = frame.view(dtype=np.uint8).reshape(HEIGHT, PIXEL_W, 1)

    # Output path: same folder & stem as the .bin file, .png extension
    png_path = os.path.splitext(bin_path)[0] + ".png"

    img = Image.fromarray(unpacked[:, :, 0], mode='L')
    img.save(png_path)

    print(f"  [OK]   {bin_path}")
    print(f"         → {png_path}")
    print(f"            shape={unpacked.shape}  "
          f"min={unpacked.min()}  max={unpacked.max()}  "
          f"mean={unpacked.mean():.1f}  "
          f"nonzero={np.count_nonzero(unpacked)}")
    return True


def main() -> None:
    # Optional argument: directory to search (defaults to current directory)
    search_dir = sys.argv[1] if len(sys.argv) > 1 else "."
    pattern    = os.path.join(search_dir, "*.bin")
    bin_files  = sorted(glob.glob(pattern))

    if not bin_files:
        print(f"No .bin files found in '{search_dir}'")
        return

    print(f"Found {len(bin_files)} .bin file(s) in '{search_dir}'\n")

    results  = [bin_to_png(f) for f in bin_files]
    ok       = sum(results)
    skipped  = len(results) - ok

    print(f"\nDone — converted: {ok}  |  skipped (wrong size): {skipped}")


if __name__ == "__main__":
    main()

