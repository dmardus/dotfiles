#!/usr/bin/env bash
set -e
echo "[*] Installing Joplin..."
flatpak install -y flathub net.cozic.joplin_desktop
echo "[✓] Joplin installed."
