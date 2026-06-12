// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract studentRecords{

    struct Student{
        string name;
        uint[] mark;
    }

    Student public student;

    function setName(string memory _name)public{
        student.name=_name;
    }

    function addmark(uint _mark)public{
        student.mark.push(_mark);
    }

    function totalmarkscount() public view returns (uint){
        return student.mark.length;
    }
}