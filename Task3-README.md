# 🧠 Octra Task 3 – OneClick Setup

This script automates everything needed for **Task 3** of the Octra challenge.

It installs dependencies, builds the client, prompts your wallet info, and launches the binary.

---

## ✅ What You Need Ready

Before running the script, have the following:

- Your **wallet address**
- Your **private key** (Base64-encoded)

---

## 🚀 How to Run

### 🆕 First Time Clone

```bash
git clone https://github.com/emmogrin/octra-oneclick.git
cd octra-oneclick
chmod +x octra-task3.sh
./octra-task3.sh
```
🔁 If You Already Cloned Before

To safely update without losing changes:
```
cd octra-oneclick
git stash --include-untracked
git pull
git stash pop
chmod +x octra-task3.sh
./octra-task3.sh

```
---

🎮 Inside the Binary

You'll see an interface with 15 options. Here's what they do:

No = Function (just as in the image below)

[![Screenshot-20250727-233625-Termux.jpg](https://i.postimg.cc/wBB1KGwS/Screenshot-20250727-233625-Termux.jpg)](https://postimg.cc/tsLqW2Q5)



## basically you are to:

1) run ocs01 test contract and claim 1 test token

2) test all functions of the math contract one by one

3) discuss and ask for guidance in discord.gg/octra

---


Script by @admirkhen for Octra testnet.

---
