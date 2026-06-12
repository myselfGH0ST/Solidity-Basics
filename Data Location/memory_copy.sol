// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract memorycopy{
    uint[] public num = [1,2,3];

    function test() public view returns (uint){
        uint[] memory copy = num;
        copy[0]=100;
        return copy[0];
    }
}