#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sudo pacman -Syu --noconfirm

apps=(
  btop ghostty curl fastfetch fish git nushell starship wget stow
  flatpak yay vscode zed windsurf brave joplin
)

for app in "${apps[@]}"; do
  bash "$SCRIPT_DIR/install-$app.sh"
done

echo "[✓] Arch setup complete."
