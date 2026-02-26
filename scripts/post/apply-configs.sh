#!/usr/bin/env bash
set -euo pipefail

configs=(
  btop
  fastfetch
  fish
  ghostty
  starship
)

# Move to repo root
cd "$(dirname "$0")/../.."

# Move into config folder
cd config

for cfg in "${configs[@]}"; do
    if [[ "$cfg" == "btop" ]]; then
      rm -f "$HOME/.config/btop/btop.config"
      rm -rf "$HOME/.config/btop/themes"
    fi

    if [[ "$cfg" == "fastfetch" ]]; then
      rm -f "$HOME/.config/fastfetch/config.jsonc"
    fi

    if [[ "$cfg" == "fish" ]]; then
      rm -f "$HOME/.config/fish/config.fish"
    fi

    if [[ "$cfg" == "ghostty" ]]; then
      rm -f "$HOME/.config/ghostty/config"
    fi

    if [[ "$cfg" == "starship" ]]; then
      rm -f "$HOME/.config/starship.toml"
    fi

    echo "Stowing $cfg"
    stow "$cfg"
done
