
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tryTopics{

    uint public fallBackCount;
    uint public receiveCount;

    receive() external payable {
        receiveCount++;
     }

    fallback() external payable {
        fallBackCount++;
     }

     function getBalance () public view returns (uint) {
        return address(this).balance;
     }
}