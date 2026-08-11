#!/usr/bin/env bash

set -euo pipefail

URL="http://launchpadlibrarian.net/845777996/dmz-cursor-theme_0.4.5.3build1_all.deb"
WORKDIR="$(mktemp -d)"

echo "Using temporary directory: $WORKDIR"

cd "$WORKDIR"

# Download package
curl -L -o dmz-cursor-theme.deb "$URL"

# Extract .deb
ar x dmz-cursor-theme.deb

# Extract payload
if [ -f data.tar.xz ]; then
  tar -xJf data.tar.xz
elif [ -f data.tar.gz ]; then
  tar -xzf data.tar.gz
elif [ -f data.tar.zst ]; then
  tar --zstd -xf data.tar.zst
else
  echo "Unsupported package format"
  exit 1
fi

# Install cursor themes only
sudo mkdir -p /usr/share/icons

if [ -d usr/share/icons/DMZ-White ]; then
  sudo cp -a usr/share/icons/DMZ-White /usr/share/icons/
fi

if [ -d usr/share/icons/DMZ-Black ]; then
  sudo cp -a usr/share/icons/DMZ-Black /usr/share/icons/
fi

echo "Installed themes:"
ls -1 /usr/share/icons | grep '^DMZ-' || true

echo "Done."
