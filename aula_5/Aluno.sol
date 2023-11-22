

pragma solidity ^0.8.0;


contract Aluno{
    string public situation;

    constructor(){
        situation = "Neutral";
    }

    function setStudentSituation(uint256 _grade) public{
        if(_grade >=7){
            situation = "Approved";
        }
        else{
            situation = "Reproved";
        }
    }
}


contract Aluno2{
    string public situation;

    constructor(){
        situation = "Neutral";
    }

    function setStudentSituation(uint256 _grade) public{
        if(_grade >=7){
            situation = "Approved";
        }
        else if(_grade == 5){
            situation = "Recovering";
        }
        else{
            situation = "Reproved";
        }
    }
}

contract Aluno3{
    string public situation;

    constructor(){
        situation = "Neutral";
    }

    function setStudentSituation(uint256 _grade) public{
        if(_grade < 0 || _grade > 10){
            situation = "Error";
        }
        else{
            if(_grade >=7){
                situation = "Approved";
            }else{
                if(_grade == 5){
                    situation = "Recovering";
                }
                else{
                    situation = "Reproved";
                }
            }
        }
    }
}

