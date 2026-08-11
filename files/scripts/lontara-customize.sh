#!/usr/bin/env bash

set -oue pipefail

echo "Customizing GDM login screen"

mkdir -p /etc/dconf/profile
cat <<EOF >/etc/dconf/profile/gdm
user-db:user
system-db:gdm
file-db:/usr/share/gdm/greeter-dconf-defaults
EOF

mkdir -p /etc/dconf/db/gdm.d

cat <<EOF >/etc/dconf/db/gdm.d/00-gdm-settings
[org/gnome/login-screen]
logo='/usr/share/pixmaps/lontara-gdm-logo.png'
EOF

dconf update

echo "Customizing GDM login screen complete"
