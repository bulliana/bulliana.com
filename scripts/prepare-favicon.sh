#!/bin/bash

# Script to prepare a photo as a favicon for bulliana.com
# Usage: ./scripts/prepare-favicon.sh /path/to/your/photo.jpg

if [ -z "$1" ]; then
    echo "Usage: ./scripts/prepare-favicon.sh /path/to/your/photo.jpg"
    exit 1
fi

INPUT_IMAGE="$1"
PUBLIC_DIR="public"

if [ ! -f "$INPUT_IMAGE" ]; then
    echo "Error: Image file not found: $INPUT_IMAGE"
    exit 1
fi

echo "Preparing favicon from: $INPUT_IMAGE"

# Create square favicon versions using sips (macOS built-in)
# 32x32 for standard favicon
sips -z 32 32 "$INPUT_IMAGE" --out "$PUBLIC_DIR/favicon-32x32.png" > /dev/null 2>&1

# 64x64 for higher DPI
sips -z 64 64 "$INPUT_IMAGE" --out "$PUBLIC_DIR/favicon-64x64.png" > /dev/null 2>&1

# 128x128 for Apple touch icon and larger displays
sips -z 128 128 "$INPUT_IMAGE" --out "$PUBLIC_DIR/favicon-128x128.png" > /dev/null 2>&1

# 180x180 for Apple touch icon
sips -z 180 180 "$INPUT_IMAGE" --out "$PUBLIC_DIR/apple-touch-icon.png" > /dev/null 2>&1

# Also create a 16x16 version
sips -z 16 16 "$INPUT_IMAGE" --out "$PUBLIC_DIR/favicon-16x16.png" > /dev/null 2>&1

echo "✅ Favicon files created in $PUBLIC_DIR:"
echo "   - favicon-16x16.png"
echo "   - favicon-32x32.png"
echo "   - favicon-64x64.png"
echo "   - favicon-128x128.png"
echo "   - apple-touch-icon.png"
echo ""
echo "Note: You may want to create an SVG version for modern browsers."
echo "The layout has been updated to use these favicon files."

