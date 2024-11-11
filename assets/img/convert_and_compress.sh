shopt -s nullglob
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

MAX_PIXEL_WIDTH=400
QUALITY=80
for i in *.png; do
  convert "$i" "${i%.*}.jpg"
done
for i in *_original.jpg; do
  # Reorient first
  $SCRIPT_DIR/reorient.py "$i"
  # Now compress
  convert "${i%.*}_oriented.jpg" -resize ${MAX_PIXEL_WIDTH}x\> -quality $QUALITY -strip "${i%_original.*}.jpg"
done
