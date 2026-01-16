shopt -s nullglob
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

MAX_PIXEL_WIDTH=400
QUALITY=80
for i in *.png; do
  convert "$i" "${i%.*}.jpg"
done
for i in *_original.{jpg,JPG}; do
  [ -e "$i" ] || continue

  ext="${i##*.}"                # jpg or JPG
  base="${i%.*}"                # filename without extension

  # Reorient first (creates ${base}_oriented.$ext)
  "$SCRIPT_DIR/reorient.py" "$i"

  # Now compress
  convert "${base}_oriented.${ext}" \
    -resize "${MAX_PIXEL_WIDTH}x>" \
    -quality "$QUALITY" \
    -strip "${base%_original}.jpg"
done
