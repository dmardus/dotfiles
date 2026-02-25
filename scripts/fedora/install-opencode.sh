#!/usr/bin/env bash
set -e
echo "[*] Installing OpenCode..."
curl -fsSL https://opencode.ai/install | /bin/bash -s -- -y
echo "[✓] OpenCode installed."
