// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Defining the interface
interface Icalculator {
    function add(uint a,uint b) external pure returns (uint);
}

//Implementing the interface
contract calculator is Icalculator {

    function add(uint a,uint b) external pure returns (uint){
        return a+b;
    }
}

//Call by interface
contract caller {

    uint private a=10;
    uint private b=20;

    function callAdd(address calculatorAddress) public view returns (uint){
        Icalculator calc = Icalculator(calculatorAddress);
        return calc.add(a,b);
    }
}


// YOU (Remix)
//    ↓
// caller.callAdd(calculatorAddress)
//    ↓
// ICalculator reference created
//    ↓
// call goes to calculator contract
//    ↓
// add(2,3) runs
//    ↓
// returns 5