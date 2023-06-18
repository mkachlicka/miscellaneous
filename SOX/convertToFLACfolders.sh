#!/bin/bash

SOURCE_FOLDER="samples"
OUTPUT_FOLDER="converted"

# Create the output folder if it doesn't exist
mkdir -p "$OUTPUT_FOLDER"

for file in "$SOURCE_FOLDER"/*.wav; do
  base=$(basename "$file" .wav)
  sox "$file" "$OUTPUT_FOLDER/$base.flac"
done
