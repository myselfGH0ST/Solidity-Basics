// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage{

    uint public data;

    function setData (uint x) public {
        data = x;
    }

    function getData () public view returns (uint) {
        return data;
    }
}