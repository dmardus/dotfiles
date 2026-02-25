# Detect distro
set DISTRO (grep '^ID=' /etc/os-release | sed 's/ID=//')

# Arch Linux functions
if test "$DISTRO" = "arch"
    function sysupdate
        echo "🔄 Checking Arch Linux News..."
        curl -s https://archlinux.org/news/ | grep -m 5 '<li>' | sed 's/<[^>]*>//g'

        echo "📦 Updating pacman (official repos)..."
        sudo pacman -Syu

        echo "📦 Updating yay (AUR packages)..."
        yay -Syu

        echo "📦 Updating flatpak apps..."
        flatpak update -y

        echo "✨ System update complete!"
    end

    function syscleanup
        echo "🧹 Cleaning pacman cache..."
        sudo pacman -Sc --noconfirm

        echo "🧹 Cleaning yay cache..."
        yay -Sc --noconfirm

        echo "🧹 Removing unused flatpak runtimes..."
        flatpak uninstall --unused -y

        echo "🧹 Vacuuming systemd journal (keep 500MB)..."
        sudo journalctl --vacuum-size=500M

        echo "🧹 Removing orphan packages..."
        set orphans (pacman -Qtdq)
        if test -n "$orphans"
            sudo pacman -Rns $orphans
        else
            echo "No orphan packages found."
        end

        echo "✨ Cleanup complete!"
    end
end

# Fedora functions
if test "$DISTRO" = "fedora"
    function sysupdate --description "Update Fedora system"
        echo "🔍 Refreshing package metadata..."
        sudo dnf upgrade --refresh -y

        echo "⬆️ Applying upgrades..."
        sudo dnf upgrade -y

        echo "🧹 Removing unused dependencies..."
        sudo dnf autoremove -y

        echo "📦 Updating Flatpak apps..."
        flatpak update -y

        if type -q fwupdmgr
            echo "🔧 Checking firmware updates..."
            sudo fwupdmgr refresh
            sudo fwupdmgr update
        end

        echo "✨ System update complete!"
    end

    function syscleanup --description "Clean up Fedora system"
        echo "🧹 Cleaning DNF caches..."
        sudo dnf clean all

        echo "🧽 Removing old journal logs..."
        sudo journalctl --vacuum-time=14d

        echo "🗑️ Clearing thumbnail cache..."
        rm -rf ~/.cache/thumbnails/*

        echo "🧹 Removing unused flatpak runtimes..."
        flatpak uninstall --unused -y

        echo "✨ Cleanup complete!"
    end
end

# Ubuntu functions
if test "$DISTRO" = "ubuntu"
    function sysupdate --description "Update Ubuntu system"
        echo "🔍 Updating package lists..."
        sudo apt update

        echo "⬆️ Upgrading packages..."
        sudo apt upgrade -y

        echo "⬆️ Full distribution upgrade..."
        sudo apt full-upgrade -y

        echo "🧹 Removing unused packages..."
        sudo apt autoremove -y

        echo "✨ System update complete!"
    end

    function syscleanup --description "Clean up Ubuntu system"
        echo "🧹 Cleaning APT cache..."
        sudo apt autoremove -y
        sudo apt autoclean -y
        sudo apt clean

        echo "🧽 Removing old journal logs..."
        sudo journalctl --vacuum-time=14d

        echo "🗑️ Clearing thumbnail cache..."
        rm -rf ~/.cache/thumbnails/*

        echo "✨ Cleanup complete!"
    end
end

# Starship
starship init fish | source
export PATH="$HOME/.local/bin:$PATH"
