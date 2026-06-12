// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyBankV3{

    uint internal  balance;
    address internal  owner;

    constructor(){
        owner=msg.sender;
    }

    modifier onlyOwner(){
        require(owner==msg.sender,"You are not Owner");
        _;
    }

    function deposit() public payable {
        balance+=msg.value;
    }

    function withdraw (uint amount) public onlyOwner{
        require(amount <= address(this).balance,"Insufficient Fund");
        balance-=amount;
        (bool success, )=owner.call{value:amount}("");
        require(success,"Transaction Failed");
    }

    function getDetails()public view returns (address,uint){
        return (owner,balance);
    }
}