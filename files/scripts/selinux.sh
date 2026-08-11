#!/usr/bin/env bash

set -oue pipefail

echo "Installing SELinux policies for Trivalent Browser"

dnf install -y --setopt=install_weak_deps=False policycoreutils-devel

# apply SELinux policies for trivalent browser
cd ./selinux/

echo "Compiling and installing SELinux policies for Trivalent Browser..."
make -f /usr/share/selinux/devel/Makefile trivalent.pp
semodule -i trivalent.pp

echo "SELinux policies for Trivalent Browser installed successfully."
restorecon -FRv /usr
