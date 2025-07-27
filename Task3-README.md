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

No.	Function

1	Greeting
2	Contract info
3	Claim 1 token
4	Check token balance
5	Dot product
6	Vector magnitude
7	Power
8	Factorial
9	Fibonacci
10	GCD
11	Prime check
12	2x2 Matrix determinant
13	Linear interpolation
14	Modular exponentiation
0	Exit



---

👤 Author

Script by @admirkhen for Octra testnet.

---
