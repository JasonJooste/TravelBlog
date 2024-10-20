shopt -s nullglob
set -e

MAX_PIXEL_WIDTH=800
QUALITY=80
for i in *.png; do
  convert "$i" "${i%.*}.jpg"
done
for i in *.jpg; do
  if [[ "$i" == *"compressed"* ]]; then
    echo skipping
    continue
  fi
  convert "$i" -resize ${MAX_PIXEL_WIDTH}x\> -quality $QUALITY -strip "${i%.*}_compressed.jpg"
done
