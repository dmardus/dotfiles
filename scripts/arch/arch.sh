#!/usr/bin/env bash
set -e

echo "🔄 Setting up Arch..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sudo pacman -Syu --noconfirm

apps=(
  curl fish git nushell starship wget stow
  ghostty opencode claudecode btop fastfetch
  flatpak yay vscode zed windsurf brave zen joplin
)

for app in "${apps[@]}"; do
  bash "$SCRIPT_DIR/install-$app.sh"
done

echo "✨ Arch setup complete."
