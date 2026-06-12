// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyBank {

    uint public balance;
    uint public rate;
    address public owner;

    constructor (uint _balance,uint _rate){
        balance=_balance;
        rate=_rate;
        owner=msg.sender;
    }

    modifier OnlyOwner(){
        require(owner==msg.sender,"You are not Owner");
        _;
    }

    function deposit (uint amount) public OnlyOwner{
        balance+=amount;
    }

    function CalculateInterest (uint bal,uint r) public pure returns (uint){
        uint interest = (bal*r)/100;
        return interest;
    }

    function GetDetails () public view returns (address,uint,uint){

        return (owner,balance,rate);
    }

}