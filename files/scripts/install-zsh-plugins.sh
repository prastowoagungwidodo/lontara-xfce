#!/usr/bin/env bash

set -euo pipefail

echo "Installing zsh plugins"

mkdir -p /usr/share/zsh/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions /usr/share/zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting /usr/share/zsh/plugins/zsh-syntax-highlighting
