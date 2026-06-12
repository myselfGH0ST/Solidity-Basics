//PROJECT 4: Decentralized Crowdfunding Platform

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CrowdFund{
    
    address public owner;
    uint public goalAmount;
    bool public campaignActive;
    mapping (address => uint) public pendingRefunds;

    event Contributed(address indexed user, uint amount);
    event Withdrawn(address indexed user, uint amount);
    event Refunded(address indexed user, uint amount);
    event CampaignEnd(address indexed user);

    constructor (uint _goalAmount){
        owner=msg.sender;
        campaignActive=true;
        goalAmount=_goalAmount;
    }
    modifier onlyOwner(){
        require(owner==msg.sender,"You are not Owner");
        _;
    }

    function contribute() public payable {
        require(campaignActive,"Campain has Ended");
        require(msg.value>0,"Insufficient Fund");
        pendingRefunds[msg.sender]+=msg.value;

        emit Contributed (msg.sender,msg.value);
    }

    function withdraw ()public onlyOwner{
        require(!campaignActive,"Campaign is Live");
        require(address(this).balance>=goalAmount);
        uint amount = address(this).balance;
        (bool success, )=payable(msg.sender).call{value:amount}("");
        require(success,"Transfer Failed");
        emit Withdrawn(msg.sender, amount);
    }

    function getRefund()public{
        require(!campaignActive,"Campaign is Live");
        require(address(this).balance<goalAmount);
        uint amount = pendingRefunds[msg.sender];
        require (amount > 0,"Insufficient Funds");
        pendingRefunds[msg.sender]=0;
        (bool success, )=payable(msg.sender).call{value:amount}("");
        require(success,"Transfer failed");
        emit Refunded(msg.sender, amount);
    }

    function endCampaign () public onlyOwner{
        require(campaignActive==true,"Campaign already ended");
        campaignActive=false;
        emit CampaignEnd(msg.sender);
    }

}