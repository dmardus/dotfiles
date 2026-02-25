#!/usr/bin/env bash
set -e

echo "[*] Setting up Gemfury Nushell repo..."
sudo tee /etc/yum.repos.d/fury-nushell.repo > /dev/null <<EOF
[gemfury-nushell]
name=Gemfury Nushell Repo
baseurl=https://yum.fury.io/nushell/
enabled=1
gpgcheck=0
gpgkey=https://yum.fury.io/nushell/gpg.key
EOF

echo "[*] Installing NuShell..."
sudo dnf install -y nushell

echo "[✓] NuShell installed."
