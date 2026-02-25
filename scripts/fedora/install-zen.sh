#!/usr/bin/env bash
set -e
echo "[*] Installing Zen Browser..."
sudo dnf config-manager --add-repo https://repo.zen-browser.app/rpm
sudo rpm --import https://repo.zen-browser.app/zen-browser.asc
sudo dnf install -y zen-browser
echo "[✓] Zen Browser installed."
