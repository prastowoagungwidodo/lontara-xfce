#!/usr/bin/env bash

set -euo pipefail

# Get latest version of the Bluecurve theme from github
# https://github.com/neeeeow/Bluecurve/releases
echo "Installing Bluecurve theme"
cd /tmp
echo "Installing dependencies"
dnf install -y gtk3-devel gtk2-devel
echo "Cloning Bluecurve repository"
git clone https://github.com/neeeeow/Bluecurve.git
cd Bluecurve
mkdir build
cd build
echo "Building Bluecurve theme"
cmake ..
make
echo "Build complete"
echo "Installing Bluecurve theme"
sudo make install

echo "Installing Luxi fonts"
cd ../fonts
sudo mkdir -p /usr/share/fonts/luxi
sudo cp *.ttf /usr/share/fonts/luxi/

echo "Bluecurve theme installed successfully"
echo "Cleaning up"
rm -rf /tmp/Bluecurve
dnf remove -y gtk3-devel gtk2-devel
dnf clean all
echo "Done."
