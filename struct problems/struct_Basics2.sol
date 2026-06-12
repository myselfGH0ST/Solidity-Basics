// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract structArray{

    struct User{
        address wallet;
        uint[] deposit;
    }

    User internal user;

    function createUser()public{
        user.wallet=msg.sender;
    }

    function depositeAmount(uint amount)public{
        user.deposit.push(amount);
    }

    function depositeCount () public view returns(uint){
        return user.deposit.length;
    }

    function getDeposit (uint index) public view returns (uint){
        return user.deposit[index];
    }

}