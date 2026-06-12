// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExpenseTracker2{

    struct User {
        address wallet;
        uint[] expense;
    }

    User public user;

    // function setUser()public{
    //     user.wallet=msg.sender;
    // }
    
    function setUser() public {
        require(user.wallet == address(0), "User already set");
        user.wallet = msg.sender;
    }


    function addExpense(uint _expense)public{
        require(user.wallet==msg.sender,"You are not owner");
        user.expense.push(_expense);
    }

    function getExpense(uint index) public view returns(uint){
        return user.expense[index];
    }

    function totalExpenseCount()public view returns(uint){
        return user.expense.length;
    }
}