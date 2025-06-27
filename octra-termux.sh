#!/data/data/com.termux/files/usr/bin/bash

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
         The Saint blesses your efforts😌
EOF
echo -e "${NC}"

echo -e "${GREEN}📱 Octra Wallet Generator Installer — Termux Edition${NC}"

# Step 1: Install dependencies
apt update && apt upgrade -y
apt install -y curl git build-essential

# Install Bun
curl -fsSL https://bun.sh/install | bash
source ~/.bashrc || export PATH="$HOME/.bun/bin:$PATH"

# Step 2: Clone the wallet-gen repo
git clone https://github.com/octra-labs/wallet-gen.git
cd wallet-gen

# Install project dependencies
bun install || source ~/.bashrc

# Fallback: Add tweetnacl manually if needed
bun add tweetnacl

# Step 3: Start the wallet generator
bun wallet_generator.ts
