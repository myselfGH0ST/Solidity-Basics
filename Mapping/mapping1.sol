// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserBalance{

    mapping (address=>uint) balances;

    function deposit(uint amount)public{
        balances[msg.sender]+=amount;
    }

    function getMyBalance(address user) public view returns(uint){
        return balances[user];
    }
}