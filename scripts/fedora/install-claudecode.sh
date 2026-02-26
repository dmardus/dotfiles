#!/usr/bin/env bash
set -e
echo "[*] Installing Claude Code CLI..."
curl -fsSL https://claude.ai/install.sh | /bin/bash -s -- latest -y
echo "[✓] Claude Code CLI installed."
