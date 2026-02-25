#!/usr/bin/env bash
set -e
echo "[*] Installing Zen Browser..."
sudo dnf copr enable sneexy/zen-browser
sudo dnf install -y zen-browser
echo "[✓] Zen Browser installed."
