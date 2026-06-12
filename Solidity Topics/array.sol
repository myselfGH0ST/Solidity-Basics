// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract arrayLearn{

    uint[] internal num;

    function addValue(uint x) public {
        num.push(x);
    }

    function getarray() public view returns(uint[] memory){
        return num;
    }

    function getLenght() public view returns (uint){
        return num.length;
    }

    function getElement(uint index) public view returns(uint){
        return num[index];
    }

    function updateElement(uint index, uint value) public {
        num[index]=value;
    }

    function deleteElement(uint index) public {
        delete num[index];
    }

}