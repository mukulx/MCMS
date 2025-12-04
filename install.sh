#!/data/data/com.termux/files/usr/bin/bash

# ═══════════════════════════════════════════════════════════════════
# Termux Proot Distro Installer
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

DISTRO=""

clear
echo -e "${CYAN}${BOLD}"
echo "╔═══════════════════════════════════════════════════════════╗"
echo "║            Termux Proot Distro Installer                  ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo -e "${NC}"
echo ""

# Check if running in Termux
if [ ! -d "/data/data/com.termux" ]; then
    echo -e "${RED}[ERROR]${NC} This installer is for Termux on Android!"
    echo "Download Termux from F-Droid: https://f-droid.org/packages/com.termux/"
    exit 1
fi

# Step 1: Update Termux
echo -e "${CYAN}[1/3]${NC} Updating Termux..."
pkg update -y
pkg upgrade -y
echo ""
echo -e "${GREEN}[OK]${NC} Termux updated"
echo ""

# Step 2: Install proot-distro
echo -e "${CYAN}[2/3]${NC} Installing proot-distro..."
pkg install -y proot-distro curl
echo ""
echo -e "${GREEN}[OK]${NC} proot-distro installed"
echo ""

# Select distro
echo -e "${CYAN}[3/3]${NC} Select Linux Distribution:"
echo ""
echo -e "  ${GREEN}1${NC}) Ubuntu    - Compatible ${YELLOW}[recommended]${NC}"
echo -e "  ${GREEN}2${NC}) Debian    - Stable"
echo -e "  ${GREEN}3${NC}) Arch      - I use Arch btw"
echo ""
read -p "Select [1-3]: " distro_choice

case $distro_choice in
    1) DISTRO="ubuntu" ;;
    2) DISTRO="debian" ;;
    3) DISTRO="archlinux" ;;
    *)
        echo -e "${RED}Invalid choice${NC}"
        exit 1
        ;;
esac

echo ""
echo -e "${GREEN}Selected: ${DISTRO}${NC}"
echo ""

# Install distro
if proot-distro list 2>/dev/null | grep -q "$DISTRO"; then
    echo -e "${YELLOW}${DISTRO} is already installed${NC}"
else
    echo -e "Installing ${DISTRO}..."
    proot-distro install $DISTRO || {
        echo -e "${RED}[ERROR]${NC} Failed to install ${DISTRO}"
        exit 1
    }
fi

echo ""
echo -e "${GREEN}════════════════════════════════════════════════${NC}"
echo -e "${GREEN}  Installation Complete!${NC}"
echo -e "${GREEN}════════════════════════════════════════════════${NC}"
echo ""
echo -e "  Distro: ${CYAN}${DISTRO}${NC}"
echo ""
echo -e "  ${YELLOW}To login:${NC}"
echo -e "  ${CYAN}proot-distro login ${DISTRO}${NC}"
echo ""
echo -e "  ${YELLOW}Logging in...${NC}"
echo ""

# Login to distro
proot-distro login $DISTRO
