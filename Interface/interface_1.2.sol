// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Defining the interface
interface IExpenseTracker {
    function getTotalExpense(address user) external view returns (uint);
}

//Implementing the interface
contract ExpenseTracker is IExpenseTracker {

    mapping (address => uint) private totalExpense;

    function addExpense (uint amount) public{
        totalExpense[msg.sender]+=amount;
    }

    function getTotalExpense (address user) external view returns (uint){
        return totalExpense[user];
    }
}

//calling by interface
contract auditor{

    function audit(address tracker, address user) public view returns (uint){
        IExpenseTracker t = IExpenseTracker (tracker);
        return t.getTotalExpense(user);
    }
}