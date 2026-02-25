.PHONY: fedora arch configs

fedora:
	@echo "[*] Running Fedora installer..."
	cd scripts/fedora && ./fedora.sh

arch:
	@echo "[*] Running Arch installer..."
	cd scripts/arch && ./arch.sh

configs:
	@echo "[*] Linking dotfiles with Stow..."
	cd config && stow -v -R .

post:
	@echo "[*] Running post-install tasks..."
	cd scripts/post && ./post-install.sh
