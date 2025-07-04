#!/bin/bash

# Colors
GREEN='\033[0;32m'
NC='\033[0m'

# 🌟 ASCII Blessing Banner
echo -e "${GREEN}"
cat << "EOF"
   ╔═══════════════════════════════════════╗
   ║             SAINT KHEN               ║
   ║          Follow @admirkhen           ║
   ╚═══════════════════════════════════════╝
         The Saint blesses your efforts🙂
EOF
echo -e "${NC}"

echo -e "${GREEN}🌐 Octra Wallet Generator Installer — PC/VPS Edition${NC}"

# Check internet
ping -c 2 github.com >/dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "❌ Network problem: Cannot reach github.com — check your internet or DNS."
  exit 1
fi

# Install dependencies
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl git build-essential ufw unzip

# Install Bun
curl -fsSL https://bun.sh/install | bash

# 🔑 Force PATH for this session
export PATH="$HOME/.bun/bin:$PATH"

# Clone repo
git clone https://github.com/octra-labs/wallet-gen.git
cd wallet-gen

# Install project dependencies
bun install

# Fallback: Add tweetnacl manually if needed
bun add tweetnacl

# Allow port
sudo ufw allow 8888

# Start the wallet generator
wallet-generator.sh
