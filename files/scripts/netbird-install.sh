#!/usr/bin/env bash

set -euo pipefail

echo "Installing NetBird..."
# NETBIRD_VERSION="0.64.5"
NETBIRD_VERSION=$(curl -s https://api.github.com/repos/netbirdio/netbird/releases/latest | grep '"tag_name":' | sed -E 's/.*"v?([^"]+)".*/\1/')

echo "Latest NetBird version: ${NETBIRD_VERSION}"

if [ -z "$NETBIRD_VERSION" ]; then
  echo "Error: Could not fetch the latest version."
  exit 1
fi

# 1. Determine Architecture
ARCH=$(uname -m)
case "${ARCH}" in
x86_64) NB_ARCH="amd64" ;;
aarch64) NB_ARCH="arm64" ;;
armv7l) NB_ARCH="armv6" ;;
*)
  echo "Unsupported architecture: ${ARCH}"
  exit 1
  ;;
esac

NETBIRD_URL="https://github.com/netbirdio/netbird/releases/download/v${NETBIRD_VERSION}/netbird_${NETBIRD_VERSION}_linux_${NB_ARCH}.tar.gz"
NETBIRD_UI_URL="https://github.com/netbirdio/netbird/releases/download/v${NETBIRD_VERSION}/netbird-ui-linux_${NETBIRD_VERSION}_linux_${NB_ARCH}.tar.gz"

echo "Extracting NetBird binary for ${NB_ARCH}..."

# 2. Extract ONLY the 'netbird' file and move it to /usr/bin
# We use --wildcards (if using GNU tar) or just specify the filename
echo "Downloading and extracting NetBird from ${NETBIRD_URL}..."
curl -L "${NETBIRD_URL}" | tar -xz -C /usr/bin/ netbird
echo "Downloading and extracting NetBird UI from ${NETBIRD_UI_URL}..."
curl -L "${NETBIRD_UI_URL}" | tar -xz -C /usr/bin/ netbird-ui

# Ensure it is executable
echo "Making NetBird binary executable..."
chmod +x /usr/bin/netbird
chmod +x /usr/bin/netbird-ui

echo "NetBird installation completed successfully."
