// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyBankV2 {

    uint public balance;
    uint public interestRate;
    address public owner;

    constructor (uint _balance,uint _interestRate){
        balance=_balance;
        interestRate=_interestRate;
        owner=msg.sender;
    }

    modifier onlyOwner (){
        require (owner==msg.sender,"You are not Owner");
        _;
    }

    function deposit (uint amount) public onlyOwner {
        balance+=amount;
    }

    function withdrawl (uint amount) public onlyOwner {
        require(amount <= balance,"Low Balance");
        balance-=amount;
    }

    function calculateInterest (uint bal,uint rate) internal pure returns(uint){
        uint interest=bal*rate/100;
        return interest;
    }

    function show () public view returns (address,uint,uint){
        return (owner,balance,calculateInterest(balance, interestRate));
    } 

}