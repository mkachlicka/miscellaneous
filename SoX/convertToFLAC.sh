#!/bin/bash

for file in *.wav; do
  base="${file%.wav}"
  sox "$file" "$base.flac"
done
