pragma solidity ^0.8.0;

contract Fatorial{

    function fatFor(uint256 _number) public pure returns(uint256){
        uint256 i;
        uint256 f=1;
        for(i=1;i<=_number;i++){
            f *= i;
        }
        return f;
    }
    function fatWhile(uint256 _number) public pure returns(uint256){
        uint256 i = 1;
        uint256 f = 1;
        while (i<=_number){
            f = f *i;
            i++;
        }
        return f;

    }
}