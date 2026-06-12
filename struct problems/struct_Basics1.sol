// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract structBasics{

    struct User{
        uint age;
        address wallet;
    }

    User internal user;

    
    // function updateUser(uint age) public {
    //     user=User(age,msg.sender);
    // }
    

    function uodateUser(uint _age) public{
        user.age=_age;
        user.wallet=msg.sender;
    }

    //struct + storage concept
    function uodateage(uint _newage) public {
        User storage ref = user;
        ref.age=_newage;
    }

    function getUser () public view returns (uint,address){
        return (user.age,user.wallet);
    }

}