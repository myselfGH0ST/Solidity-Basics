# 🚀 Interface (Smart Contract Communication in Solidity)
This folder provides a practical and progressive understanding of Solidity interfaces, demonstrating how different smart contracts can
interact with each other in a modular, reusable, and standardized way.
Each file represents a different use-case, evolving from basic function calls → real-world financial systems (banking + auditing).

Through multiple real-world inspired examples, this section covers:

✅ How to define interfaces  
✅ How to implement contracts using interfaces  
✅ How to interact with external contracts  
✅ How interfaces enable modular architecture in Web3  

## 🧠 What is an Interface?
In Solidity, an interface is a contract blueprint that declares function signatures without providing their implementation.
## 🔹 Why Interfaces Matter
Interfaces are critical because they allow contracts to interact without knowing internal logic, enabling:

✅ Cross-contract communication  
✅ Standardization (ERC20, ERC721)  
✅ Code reusability  
✅ Decoupled architecture

## ⚙️ Interface Rules

❌ No function logic (only declarations)

❌ No state variables

❌ No constructors

✅ Functions are external

✅ Must be implemented using override

## 📂 FILE 1 — Calculator Interface (Basic Interaction)
This example introduces the fundamental concept of interfaces using a simple calculator system.

🔹 Structure
- ICalculator → defines add() function
- calculator → implements addition logic
- caller → interacts with calculator using interface

🔹 Execution Flow
- User → caller.callAdd()
- Interface reference created
- Call forwarded to calculator contract  
- add(a, b) executed  
- Result returned

## 📂 FILE 2 — Expense Tracker (Data Separation)
This contract simulates a system where:
- One contract (ExpenseTracker) stores user expenses
- Another contract (Auditor) reads that data via interface

🔹 Components
- IExpenseTracker → interface for reading data
- ExpenseTracker → maintains expense mapping
- auditor → retrieves data using interface


🔹 Key Learning : 
Storage contract ≠ Consumer contract


🔹 Real-world analogy : 
Database → Auditor system 

## 📂 FILE 3 — Bank System (Interface + ETH Handling)
This file introduces a real banking system using Solidity, integrating ETH transactions with interface-based interaction

🔹 Features

- Deposit ETH using payable  
- Withdraw ETH using .call  
- Store balances using mapping  
- External contract (BankViewer) reads balance

🔹 Key Learning :
Use interfaces to safely read blockchain state from another contract

## 📂 FILE 4 — Advanced Bank Interface (Full System Interaction)
This version improves the bank system by defining all operations inside the interface, including:
- deposit()
- withdraw()
- getBalance()

🔹 Features
- Complete contract functionality exposed via interface
- Uses .transfer() for ETH transfer
- Allows external contracts to fully interact with bank

🔹 Key Learning : 
Interfaces can represent entire systems, not just read functions

## 🔄 Real-World Applications
These patterns are heavily used in real Web3 systems:

🔹 ERC Tokens

🔹 DeFi Protocols

DEX → interacts with tokens via interface  
Lending → interacts with collateral contracts  
Wallets → interact with multiple contracts  


🔹 Oracles
Smart contract → calls external data provider via interface
