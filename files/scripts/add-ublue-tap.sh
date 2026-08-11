#!/usr/bin/env bash

set -euo pipefail

# Ensure Homebrew is in the PATH for the build session
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

echo "Add ublue tap"

brew tap ublue-os/tap

echo "Add ublue tap complete"
echo "This tap contains several packages that are not available in the main Homebrew repositories, including Visual Studio Code, VSCodium, JetBrains Toolbox, LM Studio, Antrigravity, etc."
echo "To install Visual Studio Code, run: brew install --cask visual-studio-code-linux"
echo "To install vscodium, run: brew install --cask vscodium-linux"
