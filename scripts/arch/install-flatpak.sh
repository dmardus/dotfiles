#!/usr/bin/env bash
set -e
echo "[*] Installing flatpak..."
sudo pacman -S --noconfirm flatpak
echo "[✓] flatpak installed."
