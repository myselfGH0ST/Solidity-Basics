//PROJECT 2: Decentralized Voting System (DVS)

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem{

    struct Proposal{
        string name;
        uint voteCount;
    }

    address public owner;
    Proposal[] public proposals;
    mapping (address => bool) public hasVoted;

     constructor(){
        owner=msg.sender;
     }

     modifier onlyOwner(){
        require(owner==msg.sender,"You are not Owner");
        _;
     }

    event ProposalCreated (string name);
    event Voted (address voter, uint proposalIndex);

    function createProposal(string memory _name) public onlyOwner{
        proposals.push(Proposal(_name,0));
        emit ProposalCreated(_name);
    }

    function vote (uint index) public {
        require(hasVoted[msg.sender]==false,"User already voted");
        Proposal storage p = proposals [index];
        p.voteCount+=1;
        hasVoted[msg.sender]=true;
        emit Voted(msg.sender, index);
    }

    function getVotes(uint index)public view returns(uint) {
        Proposal memory p = proposals [index];
        return p.voteCount;
    }

    function getProposalCount() public view returns (uint){
        return proposals.length;
    }
}