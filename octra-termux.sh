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
apt install -y curl git build-essential unzip nodejs

# Install Bun
curl -fsSL https://bun.sh/install | bash
export PATH="$HOME/.bun/bin:$PATH"

# Step 2: Clone the repo
git clone https://github.com/octra-labs/wallet-gen.git
cd wallet-gen

# Install with Bun
bun install

# Fallback: add manually
bun add tweetnacl

# If Bun fails, fallback to npm for Termux
if [ ! -d "node_modules/tweetnacl" ]; then
  echo "🔄 Bun failed — falling back to npm..."
  npm install
fi

# Run
bun wallet_generator.ts
