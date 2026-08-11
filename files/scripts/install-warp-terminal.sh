#!/usr/bin/env bash

set -euo pipefail

ARCH=$(uname -m)
if [ "$ARCH" == "x86_64" ]; then
  echo "Detected architecture: x86_64"
  echo "Installing Warp Terminal..."

  curl -L "https://app.warp.dev/download?package=rpm" -o /tmp/warp-terminal.rpm

  dnf install -y /tmp/warp-terminal.rpm

  echo "Warp Terminal installation completed successfully."
else
  echo "Unsupported architecture: $ARCH"
  exit 1
fi
