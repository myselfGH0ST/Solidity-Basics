// PROJECT 5: Subscription Payment Manager (SPM)

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract submanager{

    struct User{
        bool subActive;
        uint paidAmount;
    }

    address public owner;
    uint public subPrice;
    mapping (address => User) public users;

    constructor(uint _subPrice){
        owner=msg.sender;
        subPrice=_subPrice;
    }
    
    modifier onlyOwner(){
        require(owner==msg.sender,"You are not Owner");
        _;
    }

    event Subscribed (address indexed user, uint amount);
    event Cancelled (address indexed user, uint amount);
    event Withdrawn (address indexed user, uint amount);
    

    function subscribe() public payable  {
        require(users[msg.sender].subActive==false,"Subscription is Active");
        require(msg.value==subPrice,"Inappropirate Amount Entered");
        users[msg.sender].subActive=true;
        users[msg.sender].paidAmount=msg.value;
        emit Subscribed(msg.sender, msg.value);
    }

    function cancelSubscription() public {
        require(users[msg.sender].subActive,"Subscription Ended");
        uint amount = users[msg.sender].paidAmount/2;
        users[msg.sender].subActive=false;
        users[msg.sender].paidAmount = 0;
        (bool success, )=payable (msg.sender).call{value:amount}("");
        require(success,"Transfer Failed");
        emit Cancelled(msg.sender, amount);
    }

    function withdrawFunds() public onlyOwner{
        require(address(this).balance>0,"Insufficient Funds");
        uint amount = address(this).balance;
        (bool success, )=payable(msg.sender).call{value:amount}("");
        require(success,"Transfer Failed");
        emit Withdrawn (msg.sender, amount);
    }

    function getSubscriptionStatus() public view returns (bool){
        return users[msg.sender].subActive;
    }

}