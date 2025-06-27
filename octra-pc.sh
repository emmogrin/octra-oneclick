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

# ✅ Check internet first
ping -c 2 github.com >/dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "❌ Network problem: Cannot reach github.com — check your internet or DNS settings."
  exit 1
fi

# Step 1: Install dependencies
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl git build-essential ufw unzip

# Install Bun
curl -fsSL https://bun.sh/install | bash
source $HOME/.bashrc || export PATH="$HOME/.bun/bin:$PATH"

# Step 2: Clone the wallet-gen repo
git clone https://github.com/octra-labs/wallet-gen.git
cd wallet-gen

# Install project dependencies
bun install || source $HOME/.bashrc

# Fallback: Add tweetnacl manually if needed
bun add tweetnacl

# Step 3: Open port 8888
sudo ufw allow 8888

# Step 4: Start the wallet generator
bun wallet_generator.ts
