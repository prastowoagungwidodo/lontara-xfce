#!/usr/bin/env bash

set -euo pipefail

echo "Enabling faillock"

authselect enable-feature with-faillock
