#!/usr/bin/env bash
set -e

if ! command -v yay >/dev/null 2>&1; then
  sudo pacman -S --needed --noconfirm base-devel git
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay
  makepkg -si --noconfirm
fi
