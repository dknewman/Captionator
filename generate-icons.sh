#!/bin/bash

# Generate iOS app icon sizes from the base 1024x1024 PNG
BASE_ICON="app-icon-1024x1024.png"

# iOS App Icon sizes (iPhone and iPad)
SIZES=(20 29 40 58 60 76 80 87 120 152 167 180 1024)

echo "Generating app icons from $BASE_ICON..."

for size in "${SIZES[@]}"; do
    output_file="app-icon-${size}x${size}.png"
    echo "Creating ${output_file}..."
    sips -z $size $size "$BASE_ICON" --out "$output_file"
done

echo "Icon generation complete!"
echo ""
echo "Generated the following icon sizes:"
ls -la app-icon-*.png | awk '{print $9, $5" bytes"}'