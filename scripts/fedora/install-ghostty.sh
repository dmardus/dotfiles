#!/usr/bin/env bash
set -e
echo "[*] Installing ghostty..."
sudo dnf copr enable scottames/ghostty -y
sudo dnf install -y ghostty
echo "[✓] ghostty installed."
