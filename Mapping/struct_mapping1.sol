// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract structMapping{

    struct User{
        uint[] expense;
        uint totalExpense;
    }

    mapping (address => User) private users;

    function addExpense(uint amount) public {
        users[msg.sender].expense.push(amount);
        users[msg.sender].totalExpense+=amount;
    }

    function getExpenseCount() public view returns(uint){
        return users[msg.sender].expense.length;
    }

    function getExpense(uint index) public view returns(uint){
        return users[msg.sender].expense[index];
    }

    function getTotalExpense() public view returns (uint){
        return users[msg.sender].totalExpense;
    }
}