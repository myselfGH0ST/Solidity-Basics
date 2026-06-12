// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherTransfer{

    address public owner;

    constructor(){
        owner=msg.sender;
    }

    modifier onlyOwner(){
        require(owner==msg.sender,"Not Owner");
        _;
    }

    //Deposite Ether
    function deposit() public payable {}

    //Transfer Ether to owner
    function withdraw (uint amount) public onlyOwner{
        require(amount<= address(this).balance,"Insufficient Fund");

        (bool success, ) = owner.call{value: amount}(""); // Transferring Statement
        require(success, "Transfer failed");

    }
}