// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MappingPractice{

    mapping (address=>uint[]) public user;

    function addNumber(uint num) public {
        user[msg.sender].push(num);
    }

    function getCount() public view returns(uint){
        return user[msg.sender].length;
    }
}