#!/bin/bash

# Check if at least two arguments are provided
if [ "$#" -lt 2 ]; then
  echo "Usage: $0 source_file1 [source_file2 ...] target_file_or_directory"
  exit 1
fi

# The last argument is either a target directory or a target file
target="${@: -1}"

# If the target is a directory
if [ -d "$target" ]; then
  # Loop through all arguments except the last (which is the directory)
  for file in "${@:1:$#-1}"; do
    if [ ! -f "$file" ]; then
      echo "Warning: $file is not a valid file, skipping."
      continue
    fi

    # Extract the filename and extension
    filename=$(basename -- "$file")
    extension="${filename##*.}"
    name="${filename%.*}"

    # Add '_original' to the name before the extension
    if [ "$filename" != "$extension" ]; then
      new_name="${name}_original.${extension}"
    else
      # Handle files without an extension
      new_name="${filename}_original"
    fi

    # Copy the file with the modified name to the target directory
    cp "$file" "$target/$new_name"
  done
else
  # If the target is a single file (rename operation)
  if [ "$#" -ne 2 ]; then
    echo "Error: When renaming, you can only specify one source file and one target file."
    exit 1
  fi

  source_file="$1"

  # Ensure the source file exists
  if [ ! -f "$source_file" ]; then
    echo "Error: $source_file is not a valid file."
    exit 1
  fi

  # Extract the filename and extension
  filename=$(basename -- "$source_file")
  extension="${filename##*.}"
  name="${filename%.*}"

  # Add '_original' to the name before the extension
  if [ "$filename" != "$extension" ]; then
    new_name="${name}_original.${extension}"
  else
    new_name="${filename}_original"
  fi

  # Copy the source file to the new name
  cp "$source_file" "$new_name"
fi
