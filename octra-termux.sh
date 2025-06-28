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

echo -e "${GREEN}📦 Octra Wallet Generator Installer — Proot-Distro Edition${NC}"

# Check internet
ping -c 2 github.com >/dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "❌ Network error: Cannot reach github.com. Check your connection or DNS."
  exit 1
fi

# Update & install deps (no sudo — you’re root)
apt update && apt upgrade -y
apt install -y curl git build-essential ufw unzip nodejs npm

# Install Bun
curl -fsSL https://bun.sh/install | bash

# Add Bun to PATH for this session
export PATH="$HOME/.bun/bin:$PATH"

# Clone the repo
git clone https://github.com/octra-labs/wallet-gen.git

# Verify clone
if [ ! -d "wallet-gen" ]; then
  echo "❌ Clone failed. Exiting."
  exit 1
fi

# Go into wallet-gen
cd wallet-gen

# Install Bun deps
bun install

# Add tweetnacl
bun add tweetnacl

# Fallback if Bun messed up:
if [ ! -d "node_modules/tweetnacl" ]; then
  echo "🔄 Bun failed — using npm fallback..."
  npm install tweetnacl
fi

# Allow port 8888 (firewall)
ufw allow 8888

# ✅ Run the generator from the right folder
bun wallet_generator.ts
