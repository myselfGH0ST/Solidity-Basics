// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract calldataReadonly{

    function sumLenth(uint[] calldata arr) public pure returns (uint){
        return arr.length;
    }
}