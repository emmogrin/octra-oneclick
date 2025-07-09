#!/bin/bash

# Colors
GREEN='\033[0;32m'
NC='\033[0m'

# 🌟 Saint Blessing Banner
echo -e "${GREEN}"
cat << "EOF"
   ╔═══════════════════════════════════════╗
   ║             SAINT KHEN               ║
   ║          Follow @admirkhen           ║
   ╚═══════════════════════════════════════╝
         The Saint blesses your efforts🙂
EOF
echo -e "${NC}"

echo -e "${GREEN}📦 Octra CLI Installer — Proot/Termux/PC Edition${NC}"

# 1️⃣ Update & install Python tools
apt update && apt upgrade -y
apt install -y python3 python3-pip python3-venv python3-dev git curl

# 2️⃣ Clone or pull latest Octra CLI
if [ -d "octra_pre_client" ]; then
  echo -e "${GREEN}🔄 Updating existing repo...${NC}"
  cd octra_pre_client
  git pull
else
  echo -e "${GREEN}📥 Cloning fresh repo...${NC}"
  git clone https://github.com/octra-labs/octra_pre_client.git
  cd octra_pre_client
fi

# 3️⃣ Create virtual environment & activate
if [ ! -d "venv" ]; then
  python3 -m venv venv
fi
source venv/bin/activate

# 4️⃣ Install requirements (always re-check)
pip install --upgrade pip
pip install -r requirements.txt

# 5️⃣ Prompt for private key & address, then write wallet.json
echo -e "${GREEN}🔑 Paste your private key (Base64, no spaces):${NC}"
read -r my_priv_key

echo -e "${GREEN}📬 Paste your Octra address (starts with oct...):${NC}"
read -r my_addr

cat <<EOF > wallet.json
{
  "priv": "$my_priv_key",
  "addr": "$my_addr",
  "rpc": "https://octra.network"
}
EOF

echo -e "${GREEN}✅ wallet.json created with your private key & address.${NC}"

echo -e ""
echo -e "${GREEN}✅ When ready, activate venv and launch CLI:${NC}"
echo -e "cd octra_pre_client"
echo -e "source venv/bin/activate"
echo -e "python3 cli.py"
echo -e ""

echo -e "${GREEN}📌 Use Octra Explorer & share feedback in Discord: https://discord.gg/octra${NC}"
