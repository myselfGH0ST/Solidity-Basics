# 🚀 Constructor Problems (Level 1 → Level 3)

This folder demonstrates the progressive evolution of a banking smart contract, focusing on how constructors, access control, and ETH handling improve across levels. A step-by-step progression of a banking smart contract, evolving from basic constructor usage to secure real ETH handling.

## 🔹 Level 1 – Basic Constructor & Owner Control
- Introduces a simple bank contract initialized using a constructor with balance and interest rate.
- Implements owner-based access control using a modifier.
- Allows only the owner to deposit funds.
- Includes a pure function to calculate interest (not dependent on contract state).
- Demonstrates basic state reading using a getter function.

👉 Focus: Constructor usage + access control + basic logic

## 🔹 Level 2 – Extended Banking Logic
- Builds on Level 1 by adding withdraw functionality with balance validation.
- Introduces internal functions for better encapsulation (calculateInterest).
- Improves abstraction by computing interest dynamically inside a view function.
- Maintains strict owner-only operations for deposits and withdrawals.

👉 Focus: Better structure + withdrawal handling + internal logic reuse

## 🔹 Level 3 – Real ETH Handling (Payable Contract)
- Moves from simulated balance to real ETH transactions using payable.
- Deposit now accepts actual ETH via msg.value.
- Withdraw function transfers ETH securely using .call.
- Uses contract balance (address(this).balance) for validation.
- Marks variables as internal for better encapsulation.

👉 Focus: Real ETH interaction + secure transfer + production-style logic

## Across all three levels, this section demonstrates:

- Constructor design evolution
- Access control using modifiers
- State vs pure vs internal functions
- Transition from simulated values → real ETH handling
- Secure fund management in smart contracts
