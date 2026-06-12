// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRegistry{

    struct Student{
        string name;
        uint[] marks;
        uint totalMarks;
    }

    mapping (address => Student) private students;

    function setName(string memory _name) public {
        students[msg.sender].name=_name;
    }

    function addMarks(uint _mark) public {
        students[msg.sender].marks.push(_mark);
        students[msg.sender].totalMarks+=_mark;
    }

    function getMarksCount() public view returns (uint){
        return students[msg.sender].marks.length;
    }

    function getAverageMarks() public view returns(uint)
    {
        return (students[msg.sender].totalMarks)/(students[msg.sender].marks.length);
    }
}