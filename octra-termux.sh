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

# ✅ REAL network check — uses HTTPS not ICMP
curl -I https://github.com >/dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "❌ Network error: Cannot reach github.com via HTTPS. Check your connection."
  exit 1
fi

# Update & install dependencies (NO sudo — you’re root in proot)
apt update && apt upgrade -y
apt install -y curl git build-essential ufw unzip nodejs npm

# Install Bun
curl -fsSL https://bun.sh/install | bash

# Add Bun to PATH for this session immediately
export PATH="$HOME/.bun/bin:$PATH"

# Clone the wallet generator repo
git clone https://github.com/octra-labs/wallet-gen.git

# Verify clone worked
if [ ! -d "wallet-gen" ]; then
  echo "❌ Clone failed. Exiting."
  exit 1
fi

# Enter the repo
cd wallet-gen

# Install dependencies with Bun
bun install

# Add tweetnacl
bun add tweetnacl

# If Bun didn’t add tweetnacl, fallback to npm
if [ ! -d "node_modules/tweetnacl" ]; then
  echo "🔄 Bun failed — using npm fallback..."
  npm install tweetnacl
fi

# Open port 8888 with ufw (optional in proot)
ufw allow 8888

# ✅ Run the wallet generator from the correct folder
bun wallet_generator.ts
