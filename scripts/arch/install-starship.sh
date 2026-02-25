#!/usr/bin/env bash
set -e
echo "[*] Installing starship..."
curl -sS https://starship.rs/install.sh | sh -s -- -y
echo "[✓] starship installed."
