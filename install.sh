#!/data/data/com.termux/files/usr/bin/bash

# ═══════════════════════════════════════════════════════════════════
# MCMS Installer - Minecraft Mobile Server
# https://github.com/mukulx/MCMS
#
# Install: curl -sL https://raw.githubusercontent.com/mukulx/MCMS/main/install.sh | bash
# ═══════════════════════════════════════════════════════════════════

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

MCMS_RAW="https://raw.githubusercontent.com/mukulx/MCMS/main/mcms.sh"
DISTRO="ubuntu"

clear
echo -e "${CYAN}${BOLD}"
echo "╔═══════════════════════════════════════════════════════════╗"
echo "║              MCMS - Minecraft Mobile Server               ║"
echo "║                      Installer                            ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo -e "${NC}"
echo ""

# Check if running in Termux
if [ ! -d "/data/data/com.termux" ]; then
    echo -e "${RED}[ERROR]${NC} This installer is for Termux on Android!"
    echo "Download Termux from F-Droid: https://f-droid.org/packages/com.termux/"
    exit 1
fi

# Select distro
echo -e "${CYAN}Select Linux Distribution:${NC}"
echo ""
echo -e "  ${GREEN}1${NC}) Ubuntu    - Compatible ${YELLOW}[recommended]${NC}"
echo -e "  ${GREEN}2${NC}) Debian    - Stable"
echo -e "  ${GREEN}3${NC}) Arch      - I use Arch btw"
echo ""
read -p "Select [default: 1]: " distro_choice

case $distro_choice in
    2) DISTRO="debian" ;;
    3) DISTRO="archlinux" ;;
    *) DISTRO="ubuntu" ;;
esac

echo ""
echo -e "${GREEN}Selected: ${DISTRO}${NC}"
echo ""

# Step 1: Update Termux
echo -e "${CYAN}[1/4]${NC} Updating Termux..."
yes | pkg update 2>/dev/null || true
yes | pkg upgrade 2>/dev/null || true
echo -e "${GREEN}[OK]${NC} Termux updated"
echo ""

# Step 2: Install proot-distro
echo -e "${CYAN}[2/4]${NC} Installing proot-distro..."
pkg install -y proot-distro curl 2>/dev/null || {
    echo -e "${RED}[ERROR]${NC} Failed to install proot-distro"
    exit 1
}
echo -e "${GREEN}[OK]${NC} proot-distro installed"
echo ""

# Step 3: Install distro
if proot-distro list 2>/dev/null | grep -q "$DISTRO"; then
    echo -e "${CYAN}[3/4]${NC} ${DISTRO} already installed ${GREEN}✓${NC}"
else
    echo -e "${CYAN}[3/4]${NC} Installing ${DISTRO} (this takes a few minutes)..."
    proot-distro install $DISTRO || {
        echo -e "${RED}[ERROR]${NC} Failed to install ${DISTRO}"
        exit 1
    }
    echo -e "${GREEN}[OK]${NC} ${DISTRO} installed"
fi
echo ""

# Step 4: Download MCMS
echo -e "${CYAN}[4/4]${NC} Downloading MCMS..."
proot-distro login $DISTRO -- bash -c "
    mkdir -p ~/mcms
    cd ~/mcms
    curl -sL '$MCMS_RAW' -o mcms.sh
    chmod +x mcms.sh
" || {
    echo -e "${RED}[ERROR]${NC} Failed to download MCMS"
    exit 1
}
echo -e "${GREEN}[OK]${NC} MCMS downloaded"
echo ""

# Done
echo -e "${GREEN}════════════════════════════════════════════════${NC}"
echo -e "${GREEN}  Installation Complete!${NC}"
echo -e "${GREEN}════════════════════════════════════════════════${NC}"
echo ""
echo -e "  Distro: ${CYAN}${DISTRO}${NC}"
echo -e "  MCMS:   ${CYAN}~/mcms/mcms.sh${NC}"
echo ""
echo -e "  ${YELLOW}To run MCMS:${NC}"
echo -e "  ${CYAN}cd ~/mcms && ./mcms.sh${NC}"
echo ""
echo -e "  ${YELLOW}Logging into ${DISTRO}...${NC}"
echo ""

# Login to distro
proot-distro login $DISTRO
