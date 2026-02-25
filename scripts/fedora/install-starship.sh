#!/usr/bin/env bash
set -e
echo "[*] Installing Starship..."
curl -sS https://starship.rs/install.sh | sh -s -- -y
echo "[✓] Starship installed."
