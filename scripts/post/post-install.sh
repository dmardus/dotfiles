#!/usr/bin/env bash
set -e

echo "[*] Running post-install tasks..."

# Detect OS
if [ -f /etc/fedora-release ]; then
    OS="fedora"
elif [ -f /etc/arch-release ]; then
    OS="arch"
else
    OS="unknown"
fi

echo "[*] Detected OS: $OS"

########################################
# Install Nerd Fonts from repository
########################################

echo "[*] Installing Nerd Fonts..."

FONT_SRC="$REPO_ROOT/fonts"
FONT_DEST="$HOME/.local/share/fonts"

mkdir -p "$FONT_DEST"

if [ -d "$FONT_SRC" ]; then
    cp -u "$FONT_SRC"/*.ttf "$FONT_DEST" 2>/dev/null || true
    cp -u "$FONT_SRC"/*.otf "$FONT_DEST" 2>/dev/null || true

    echo "[*] Refreshing font cache..."
    fc-cache -f "$FONT_DEST"
else
    echo "[!] No fonts directory found at $FONT_SRC — skipping font installation."
fi

########################################
# Change default shell to fish
########################################

if command -v fish >/dev/null 2>&1; then
    FISH_PATH="$(command -v fish)"

    if [ "$SHELL" != "$FISH_PATH" ]; then
        echo "[*] Changing default shell to fish..."
        chsh -s "$FISH_PATH"
    else
        echo "[*] Shell already set to fish."
    fi
else
    echo "[!] Fish is not installed — skipping shell change."
fi

########################################
# Create common directories
########################################

echo "[*] Creating common directories..."
mkdir -p ~/source

########################################
# OS-specific tweaks
########################################

if [ "$OS" = "fedora" ]; then
    echo "[*] Applying Fedora-specific tweaks..."
    # Example: enable RPM Fusion, if you want
    # sudo dnf install -y \
    #   https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    #   https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
fi

if [ "$OS" = "arch" ]; then
    echo "[*] Applying Arch-specific tweaks..."
    # Example: enable multilib
    # sudo sed -i '/
    #\[multilib\]
    #/,/Include/s/^#//' /etc/pacman.conf
    # sudo pacman -Syu --noconfirm
fi

########################################
# Final message
########################################

echo "[✓] Post-install tasks complete."
echo "You may need to log out and back in for shell changes to apply."
