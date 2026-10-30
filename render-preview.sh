#!/bin/bash
# Render the Nord Polar Dark preview board.
set -euo pipefail
cd "$(dirname "$0")"

chromium --headless=new --disable-gpu --hide-scrollbars --no-sandbox \
  --force-device-scale-factor=2 --window-size=1600,900 \
  --screenshot=preview-large.png "file://$PWD/preview.html" >/dev/null 2>&1

magick preview-large.png -resize 1800x1012\! -strip preview.png

echo "Wrote preview.png (1800x1012) and preview-large.png (3200x1800)"
