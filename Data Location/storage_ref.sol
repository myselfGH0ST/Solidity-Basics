// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StorageReference{

    uint[] public num = [1,2,3];

    function update() public{
        uint[] storage ref = num;
        ref[0]=100;
    }

    function getnum() public view returns (uint[] memory){
        return num;
    }
}