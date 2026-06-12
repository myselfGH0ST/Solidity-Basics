// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract bank{

    uint public bal;
    uint public rate;
    address public owner;

    constructor(uint _bal,uint _rate){
        bal=_bal;
        rate=_rate;
        owner=msg.sender;
    }

    //view Function
    function getBalance()public view returns(uint){
        return bal;
    }

    //pure
    function calcInterest(uint amount,uint irate) public pure returns(uint){
        return (amount * irate)/100;
    }

    //view + pure 
    function getInterestAmount() public view returns (uint){
        return calcInterest(bal, rate);
    }

    
}