shopt -s nullglob
set -e

MAX_PIXEL_WIDTH=800
QUALITY=80
for i in *.png; do
  convert "$i" "${i%.*}.jpg"
done
for i in *_original.jpg; do
  convert "$i" -resize ${MAX_PIXEL_WIDTH}x\> -quality $QUALITY -strip "${i%_original.*}.jpg"
done
