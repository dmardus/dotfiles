#!/usr/bin/env bash
set -e
echo "[*] Installing zed..."
curl -f https://zed.dev/install.sh | sh  -s -- -y
echo "[✓] zed installed."
