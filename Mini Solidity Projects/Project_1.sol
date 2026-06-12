//PROJECT 1: Smart Secure Bank Vault (SSBV)

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SmartVault{

    struct User{
        uint balance;
    }

    mapping (address => User) private users;
    address public owner;

    constructor(){
        owner=msg.sender;
    }

    modifier onlyOwner (){
        require(owner==msg.sender,"You are not Owner");
        _;
    }

    bool locked;
    modifier noReentrant(){
        require(!locked,"Reentrant Call");
        locked=true;
        _;
        locked=false;
    }

    event Deposited (address indexed user, uint amount);
    event Withdrawn (address indexed user, uint amount);
    event EmergencyWithdraw (address indexed user, uint amount);

    function deposit() public payable {
        users[msg.sender].balance+=msg.value;
        emit Deposited(msg.sender,msg.value);
    }

    function withdraw(uint amount) public noReentrant{
        require(amount<=users[msg.sender].balance,"Insufficient Balance");
        users[msg.sender].balance-=amount;
        (bool success, )=payable(msg.sender).call{value:amount}("");
        require(success,"Transfer Failed");
        emit Withdrawn(msg.sender,amount);
    }

    function emergencyWithdraw () public onlyOwner{
        uint amount = address(this).balance;
        (bool success, )=payable(msg.sender).call{value:amount}("");
        require(success,"Transfer failed");
        emit EmergencyWithdraw(msg.sender, amount);
    }

    function getMyBalance () public view returns(uint){
        return users[msg.sender].balance;
    }

    function getContractBalance() public view returns(uint)
    {
        return address(this).balance;
    }
}