#!/usr/bin/env bash

set -euo pipefail

systemctl disable sshd-vsock.socket
systemctl mask sshd-vsock.socket
