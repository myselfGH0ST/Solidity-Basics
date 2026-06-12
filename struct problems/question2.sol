// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExpenseTracker1{

    struct User {
        address wallet;
        uint[] expense;
    }

    User public user;

    function setUser()public{
        user.wallet=msg.sender;
    }

    function addExpense(uint _expense)public{
        user.expense.push(_expense);
    }

    function getExpense(uint index) public view returns(uint){
        return user.expense[index];
    }

    function totalExpenseCount()public view returns(uint){
        return user.expense.length;
    }
}