#!/usr/bin/env bash
set -e
echo "[*] Installing joplin..."
flatpak install -y flathub net.cozic.joplin_desktop
echo "[✓] joplin installed."
