#!/bin/bash

# Colors
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}"
cat << "EOF"
   ╔═══════════════════════════════════════╗
   ║             SAINT KHEN               ║
   ║          Follow @admirkhen           ║
   ╚═══════════════════════════════════════╝
         The Saint blesses your efforts🙂
EOF
echo -e "${NC}"

echo -e "${GREEN}📦 Octra Wallet Generator — Proot/Termux/PC Edition${NC}"

# ✅ 1️⃣ Update & install base tools
apt update && apt upgrade -y
apt install -y curl git build-essential unzip

# ✅ 2️⃣ Install Bun if not exists
if ! command -v bun &> /dev/null; then
  curl -fsSL https://bun.sh/install | bash
  export PATH="$HOME/.bun/bin:$PATH"
else
  export PATH="$HOME/.bun/bin:$PATH"
fi

# ✅ 3️⃣ Clone fresh or update
if [ -d "wallet-gen" ]; then
  cd wallet-gen
  git pull
else
  git clone https://github.com/octra-labs/wallet-gen.git
  cd wallet-gen
fi

# ✅ 4️⃣ Force clean
echo -e "${GREEN}🔄 Cleaning old installs...${NC}"
rm -rf node_modules bun.lock .bun-cache

# ✅ 5️⃣ Install deps + patch
echo -e "${GREEN}📦 Installing dependencies...${NC}"
bun install

echo -e "${GREEN}📦 Adding required modules...${NC}"
bun add tweetnacl bip39

# ✅ 6️⃣ tsconfig fallback
if [ ! -f tsconfig.json ]; then
  cat <<EOF > tsconfig.json
{
  "compilerOptions": {
    "target": "esnext",
    "module": "commonjs",
    "strict": true,
    "esModuleInterop": true
  }
}
EOF
fi

# ✅ 7️⃣ Build
echo -e "${GREEN}⚙️ Building wallet generator...${NC}"
bun build --compile --outfile=wallet-generator ./src/server.ts

# ✅ 8️⃣ AUTO-RUN — THE KEY
echo -e "${GREEN}🚀 Launching wallet generator now...${NC}"
chmod +x ./wallet-generator
./wallet-generator

echo -e "${GREEN}✅ Done. The Saint blesses your keys.${NC}"
