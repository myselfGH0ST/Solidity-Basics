// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Defining the interface
interface IBank{
    function deposit() external payable;
    function withdraw (uint amount) external ;
    function getBalance(address user) external view returns (uint);
}

//Implementing the interface
contract Bank is IBank{

    mapping (address => uint) private balances;

    function deposit() external payable {
        balances[msg.sender]+=msg.value;
    }

    function withdraw (uint amount) external {
        require (balances[msg.sender]>=amount,"Insufficient Balance");
        balances[msg.sender]-=amount;
        payable(msg.sender).transfer(amount);
    }

    function getBalance(address user) external view returns (uint){
        return balances[user];
    }
}

//Calling Using Interface
contract BankViewer{

    function checkBalance(address bank, address user) public view returns (uint){
        IBank b = IBank(bank);
        return b.getBalance(user);
    }
}