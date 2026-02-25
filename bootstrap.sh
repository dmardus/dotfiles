#!/usr/bin/env bash
set -e

echo "[*] Detecting OS..."

if [ -f /etc/fedora-release ]; then
    OS="fedora"
elif [ -f /etc/arch-release ]; then
    OS="arch"
else
    echo "[!] Unsupported OS"
    exit 1
fi

echo "[*] Detected: $OS"

# Ensure make is installed
if ! command -v make >/dev/null 2>&1; then
    echo "[*] Installing make..."

    if [ "$OS" = "fedora" ]; then
        sudo dnf install -y make
    else
        sudo pacman -S --noconfirm make
    fi
fi

echo "[*] Running Makefile target: $OS"
make "$OS"
make "configs"
make "post"
