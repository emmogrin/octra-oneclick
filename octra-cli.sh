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

# 1️⃣ Update and install Python tools
apt update && apt upgrade -y
apt install -y python3 python3-pip python3-venv python3-dev git curl

# 2️⃣ Clone the Octra CLI repo
git clone https://github.com/octra-labs/octra_pre_client.git
cd octra_pre_client

# 3️⃣ Create virtual environment & activate
python3 -m venv venv
source venv/bin/activate

# 4️⃣ Install requirements
pip install --upgrade pip
pip install -r requirements.txt

# 5️⃣ Prompt for private key and create wallet.json
echo -e "${GREEN}🔑 Please paste your private key (Base64, no spaces):${NC}"
read -r my_priv_key

cat <<EOF > wallet.json
{
  "priv": "$my_priv_key",
  "addr": "oct93iE4P8KgFNYGWf6pKgY1tYyhBriXi7a2yMrnGgZgkBv",
  "rpc": "https://octra.network"
}
EOF

echo -e "${GREEN}✅ wallet.json created with your private key.${NC}"

echo -e ""
echo -e "${GREEN}✅ When ready, activate venv and launch CLI:${NC}"
echo -e "source venv/bin/activate"
echo -e "python3 cli.py"
echo -e ""

echo -e "${GREEN}📤 Send your test transactions to: oct93iE4P8KgFNYGWf6pKgY1tYyhBriXi7a2yMrnGgZgkBv${NC}"
echo -e "📌 Use Octra Explorer for more addresses. Share your feedback in Discord: https://discord.gg/octra"
