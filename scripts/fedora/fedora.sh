#!/usr/bin/env bash
set -e

echo "🔄 Setting up Fedora..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sudo dnf update -y

apps=(
  curl wget git btop ghostty fastfetch fish nushell starship stow
  vscode zed windsurf brave joplin
)

for app in "${apps[@]}"; do
  bash "$SCRIPT_DIR/install-$app.sh"
done

echo "✨ Fedora setup complete."
