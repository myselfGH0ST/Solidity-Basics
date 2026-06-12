// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract funcmodifier{

    uint public x;

    function set(uint a,uint b) public pure returns (uint) {
        uint c = a+b;
        return c;
    }

    function get() public view returns (uint){
        return x;
    }
    
}