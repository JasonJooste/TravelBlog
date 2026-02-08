#!/usr/bin/env python3
import argparse
from PIL.ExifTags import TAGS
from PIL import Image
from pathlib import Path

# Function to rotate the image based on its EXIF orientation
ORIENTATION_TAG = 274  # The tag for orientation
def correct_orientation(image_file):
    im_path = Path(image_file)
    im = Image.open(im_path)
    exif_data = im._getexif()
    # Check for orientation tag
    if exif_data is not None and ORIENTATION_TAG in exif_data:
        orientation = exif_data[ORIENTATION_TAG]
        if orientation == 3:
            im = im.rotate(180, expand=True)
        elif orientation == 6:
            im = im.rotate(270, expand=True)
        elif orientation == 8:
            im = im.rotate(90, expand=True)
    # Save the image with the correct orientation
    new_path = im_path.parent / (im_path.stem + "_oriented" + im_path.suffix)
    im.save(new_path)

# Main function to handle CLI arguments
def main():
    parser = argparse.ArgumentParser(description="Rotate images to the correct orientation based on EXIF data.")
    parser.add_argument("image_files", nargs="+", help="List of image files to process")
    args = parser.parse_args()

    # Process each image file
    for image_file in args.image_files:
        correct_orientation(image_file)

if __name__ == "__main__":
    main()

