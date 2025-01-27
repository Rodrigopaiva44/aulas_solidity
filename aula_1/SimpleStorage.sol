// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SimpleStorage{

    // initialize at 0! 
    uint256 number;

    function store(uint256 _number) public{
        number = _number;
    }
    function get() public view returns(uint256){
        return number;
    }
    struct Person{
        uint256 num;
        string name;
    }

    Person public abelha = Person({num: 10, name: "abelha"})

    Person[] public people; 

    mapping(string => uint256) public nameToNumber;

    function addPerson(uint256 _number, string memory _name) public{
        people.push(Person(_number,_name));
        nameToNumber[_name] = _number;
    }

}
