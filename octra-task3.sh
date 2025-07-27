#!/bin/bash

clear
echo "──────────────────────────────────────────────"
echo "   🐙 Octra OCS01 OneClick by @admirkhen 🛠️   "
echo "──────────────────────────────────────────────"
echo ""

# Ask environment
read -p "❓ Are you using [1] Termux (Phone) or [2] PC/VPS? Enter 1 or 2: " ENV

if [ "$ENV" == "1" ]; then
  SUDO=""
elif [ "$ENV" == "2" ]; then
  SUDO="sudo"
else
  echo "❌ Invalid option. Exiting."
  exit 1
fi

echo ""
echo "🔧 Updating system..."
$SUDO apt update -y && $SUDO apt upgrade -y

echo "📦 Installing dependencies..."
$SUDO apt install -y \
htop ca-certificates zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev \
tmux iptables curl nvme-cli git wget make jq libleveldb-dev build-essential \
pkg-config ncdu tar clang bsdmainutils lsb-release libssl-dev \
libreadline-dev libffi-dev gcc screen file nano btop unzip lz4

echo ""
echo "🦀 Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

echo ""
echo "📁 Cloning Octra repo..."
git clone https://github.com/octra-labs/ocs01-test.git
cd ocs01-test

echo ""
echo "⚙️ Building binary..."
cargo build --release

echo ""
echo "📄 Copying exec_interface.json..."
cp EI/exec_interface.json .

echo ""
echo "🔐 Setting up wallet.json..."
read -p "👉 Enter your base64 private key: " PRIVKEY
read -p "👉 Enter your wallet address (starts with octra...): " WALLETADDR

cat > wallet.json <<EOF
{
  "priv": "$PRIVKEY",
  "addr": "$WALLETADDR",
  "rpc": "https://octra.network"
}
EOF

echo ""
echo "✅ All done. Starting Octra CLI..."
./target/release/ocs01-test
