// PROJECT 3: Decentralized Auction System (DAS)

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AuctionHouse{

    address public owner;
    bool public auctionActive;
    uint public highestBid;
    address public highestBidder;
    mapping (address => uint) public pendingReturns;

    event BidPlaced (address bidder, uint amount);
    event Withdrawn (address bidder, uint amount);
    event AuctionEnded(address bidder, uint amount);

    constructor(){
        owner = msg.sender;
        auctionActive = true;
    }

    modifier onlyOwner(){
        require(owner==msg.sender,"You are not owner");
        _;
    }

    function placeBid() public payable{
        require(auctionActive,"Auction Ended");
        require(msg.value > highestBid, "Bid too low");
        
        if(highestBid !=0){
            pendingReturns[highestBidder]+=highestBid;
        }

        highestBidder=msg.sender;
        highestBid=msg.value;
        emit BidPlaced(msg.sender, msg.value);
    }

    function withdraw () public{
        uint amount = pendingReturns[msg.sender];
        require(amount>0,"No Funds");
        pendingReturns[msg.sender]=0;
        (bool success, )=payable (msg.sender).call{value:amount}("");
        require(success,"Transfer Failed");

        emit Withdrawn(msg.sender, amount);
    }

    function endAuction() public onlyOwner{
        require(auctionActive,"Auction Ended");
        auctionActive=false;
        (bool success, )=payable (msg.sender).call{value:highestBid}("");
        require(success,"Transfer Failed");

        emit AuctionEnded(msg.sender, highestBid);
    }


}