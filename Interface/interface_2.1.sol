// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Defining the Interface
interface IBank {
    function getBalance(address user) external view returns(uint);
}

//Implementing the Interface
contract Bank is IBank{

    mapping (address => uint)private balances;

    function deposit() public payable {
        balances[msg.sender]+=msg.value;
    }

    function getBalance(address user) external view returns (uint){
        return balances[user];
    }

    function withdraw (uint amount) external {
        require (balances[msg.sender]>=amount,"Insufficient Balance");
        balances[msg.sender]-=amount;
        
        (bool success, )=payable (msg.sender).call{value:amount}("");
        require(success,"Transfer Failed");
    }
}

//Calling using Interface
contract BankViewer{

    function checkBalance (address bank) public view returns (uint){
        IBank b = IBank (bank);
        return b.getBalance(msg.sender);
    }
}