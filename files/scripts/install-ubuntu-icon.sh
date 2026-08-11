#!/usr/bin/env bash

set -euo pipefail

curl -L \
  https://github.com/prastowoagungwidodo/ubuntu-mono-icons/archive/refs/tags/v0.0.2.zip \
  -o /tmp/ubuntu-mono-icons.zip

unzip -q /tmp/ubuntu-mono-icons.zip -d /tmp

cp -a /tmp/ubuntu-mono-icons-*/* /usr/share/icons/

