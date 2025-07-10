#!/bin/bash

Colors

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

2️⃣ Update & install base tools

apt update && apt upgrade -y
apt install -y curl git build-essential unzip

3️⃣ Install Bun if not exists

if ! command -v bun &> /dev/null; then
curl -fsSL https://bun.sh/install | bash
export PATH="$HOME/.bun/bin:$PATH"
fi

4️⃣ Clone fresh wallet-gen or update

if [ -d "wallet-gen" ]; then
cd wallet-gen
git pull
else
git clone https://github.com/octra-labs/wallet-gen.git
cd wallet-gen
fi

5️⃣ Force clean install — everything local

echo -e "${GREEN}🔄 Cleaning old installs...${NC}"
rm -rf node_modules bun.lockb .bun-cache

echo -e "${GREEN}📦 Installing dependencies...${NC}"
export BUN_INSTALL_CACHE_DIR="./.bun-cache"
bun install --cwd .

6️⃣ Double-check modules

bun add tweetnacl bip39 --cwd .

7️⃣ Write tsconfig if missing

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

8️⃣ Build wallet generator

echo -e "${GREEN}⚙️ Building wallet generator...${NC}"
bun build --cwd . --compile --outfile=wallet-generator ./src/server.ts

echo -e "${GREEN}✅ Done! Run the wallet with:${NC}"
echo -e "${GREEN}bun run src/server.ts${NC}"
echo -e ""
echo -e "${GREEN}Or use the generated ./wallet-generator binary (if built successfully).${NC}"


