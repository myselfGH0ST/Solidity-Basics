// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract mappingBasics{

    mapping (address => uint) public balances;

    function setBalance(uint amount) public {
        balances[msg.sender]=amount;
    }

    function getBalance(address user) public view returns (uint) {
        return balances[user];
    }
}