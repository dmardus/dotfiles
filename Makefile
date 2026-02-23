.PHONY: fedora arch configs

fedora:
    @echo "[*] Running Fedora installer..."
    cd scripts/fedora && ./install-fedora.sh

arch:
    @echo "[*] Running Arch installer..."
    cd scripts/arch && ./install-arch.sh

configs:
    @echo "[*] Linking configuration files..."
    ./scripts/link-configs.sh
