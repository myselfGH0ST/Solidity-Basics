# 🚀 Data Location Concepts
This section explains how Solidity handles data storage, focusing on:

✅ calldata : Read‑only input data sent to a function

✅ memory : Temporary data during function execution

✅ storage : Permanent data on blockchain

## 📘 Calldata (Read-Only)

- Used for function inputs
- Cannot be modified
- Most gas efficient

Solidity function sumLenth(uint[] calldata arr)

👉 Focus: Efficient read-only data handling


## 📘 Memory (Temporary Copy)

- Creates a copy of data
- Changes do NOT affect original state
- Exists only during function execution

Solidityuint[] memory copy = num;

👉 Example: copy[0] = 100 → original remains unchanged

👉 Focus: Temporary data manipulation


## 📘 Storage (Persistent Reference)

- Points to actual blockchain data
- Changes directly affect contract state
- Most expensive but permanent

Solidityuint[] storage ref = num;

👉 Example: ref[0] = 100 → modifies original array

👉 Focus:Permanent state updates

## 🚀 The Golden Rule (Remember This)

- State variables → storage
- Temporary calculations → memory
- External inputs → calldata
