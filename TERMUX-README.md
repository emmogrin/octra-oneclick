⚡️ Octra Testnet Guide

Welcome to Octra, a blockchain network pioneering Fully Homomorphic Encryption (FHE). Octra has raised $4M+ to build cryptographic tools for secure, private computations in isolated execution environments.

This repo lets you deploy the official Octra Wallet Generator on your Android (Termux) with a single command.
The Saint blesses your efforts! ✨


---

# 🚀 One-click install

# in Termux / Android
# Update package list
```
pkg update
```
```
pkg upgrade -y
```
# Install required packages
```
pkg install proot-distro
```
```
pkg install curl
```
```
pkg install wget
```
# Install Ubuntu
```
proot-distro install ubuntu
```
# Login ubuntu
```
proot-distro login ubuntu
```
# now inside Ubuntu
```
apt install -y
```
```
apt update && apt upgrade -y
```
```
apt install -y curl git build-essential
```
finally steps.😁 
Install bun and reload profile
```
curl -fsSL https://bun.sh/install | bash
source /root/.bashrc
```
Or manually add Bun to PATH (if needed):
```
export PATH="$HOME/.bun/bin:$PATH"
```
clone the wallet generator page
```
git clone https://github.com/octra-labs/wallet-gen.git
cd wallet-gen
```
Install project requirements
```
bun install
```
If it says bun not found enter this
```
source /root/.bashrc”
```
If it complains about missing packages like tweetnacl, install manually:
```
bun add tweetnacl
```
Step 3 - Allow port in UFW
```
ufw allow 8888
```
Step 4 - start the wallet generator
```
./wallet-generator.sh

```
---

✅ Access your wallet generator

When it’s running, open your browser (chrome):
```
http://localhost:8888 
```
Note: If you’re on a VPS, replace localhost with your server’s IP address. 
example : http://189.73.73.23:8888 


---

🔑 Generate & save

Click “Generate Wallet” on the page.

Scroll up and copy the first 4 details — these are the most important( or copy all)



---

🫂 Join the Octra community

Get help, share progress, and claim your roles in the official Octra Discord:
👉 Join Discord https://discord.gg/octra


---

⚔️ Brought to you by Saint Khen

Follow @admirkhen — The Saint blesses your efforts.
