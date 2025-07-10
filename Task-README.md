✅ TASK-README.md — Perfected

# ⚡️ Octra Testnet — Weekly Task

 **NOTE(ANDROID USERS ONLY, PC Users ignore and move to next step ) 
New Phone users are to login ubuntu using this guide before starting [📱 TERMUX-README](https://github.com/emmogrin/octra-oneclick/blob/main/TERMUX-README.md)

if you are not New as a phone guy then  just enter and proceed with the code:
```
proot-distro login ubuntu 
```

**The Saint blesses your efforts. 🗝️✨**

---

## 🗂️ This Week’s Task

### ✅ 1️⃣ Install the Octra Client

Already cloned before? Update (if you haven't skipped):
```
cd octra-oneclick
git pull
```


**New user? Clone fresh:**  
```bash
git clone https://github.com/emmogrin/octra-oneclick.git
cd octra-oneclick
```

# Run the CLI installer Make sure its the (B64 private key):
```
chmod +x octra-cli.sh
./octra-cli.sh
```
```
cd octra_pre_client
source venv/bin/activate
python3 cli.py
```

This will:

Install Python & requirements

Prompt you for your private key

Prompt you for wallet address (oct)

Auto-create your wallet.json

Get your CLI ready to launch


---

After the CLI opens, you’ll see something like this:
[![IMG-20250710-092044-197.jpg](https://i.postimg.cc/VNJYQkNG/IMG-20250710-092044-197.jpg)](https://postimg.cc/VScyX1nn)


---

✅ 2️⃣ Send Transactions (Normal & Encrypted)

**💡 New FHE Task:**  
To test the new Fully Homomorphic Encryption, you must **Encrypt some balance first**:

- Select option `4` → input amount → confirm.  
- Then select option `6` → input recipient, amount → confirm → done!

Use normal `1` for regular transfers, `6` for private encrypted ones.

Example address to send to (test it!):
```
oct93iE4P8KgFNYGWf6pKgY1tYyhBriXi7a2yMrnGgZgkBv
```
You can use the Octra Explorer to find more 
---
[![Screenshot-20250630-181339-Termux.jpg](https://i.postimg.cc/rFhwKgmt/Screenshot-20250630-181339-Termux.jpg)](https://postimg.cc/3dvTqX2K)

Note: the steps are same for the new task.
all you need to do is to Encrypt some balance first, complete private transfers and all.


[![Screenshot-20250709-231328-Termux.jpg](https://i.postimg.cc/9MSJMVyQ/Screenshot-20250709-231328-Termux.jpg)](https://postimg.cc/dk28HbWb)

✅ 3️⃣ Join & Discuss

Get help, share your progress & secure early roles:
👉 Join the [Discord](https://discord.gg/octra)

Also get faucet here if you have none: [Faucet](https://faucet.octra.network)

Keep notifications ON — the next task drops soon!


---

🧩 About Octra

Octra is pioneering Fully Homomorphic Encryption (FHE) with $4M+ raised to build secure, private blockchain tools for advanced cryptographic computation.


---

⚔️ Guide by Saint Khen — @admirkhen
The Saint blesses your efforts. ✨
