pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";

contract FundContractTest is Test {

    function setUp() external{}

    function testDemo() public {}
}

contract FundContractTest2 is Test {
    uint256 number = 1;
    function setUp() external{
        number = 2;
    }

    function testDemo() public {
        assertEq(number,2);
    }
}

contract FundContractTest3 is Test {
    uint256 number = 1;
    function setUp() external{
        number = 2;
    }

    function testDemo() public { // import {Test, console}
        console.log(number);
        console.log("hello");
        assertEq(number,2);
    }
}

import {Test, console} from "forge-std/Test.sol";
import {FundContract} from "../src/FundContract.sol";

contract FundContractTest4 is Test {
    FundContract fundContract;
    function setUp() external{
        fundContract = new FundContract();
    }

    function testMinimumDolarIsFive() public {
        assertEq(fundContract.minUsd(), 5e18);
    }

    // run forge test 

      function testOnwerIsMsgSender() public{
        // msg.sender = us
        assertEq(fundContract.owner(), msg.sender); // error 
        // address(this) = FundContract owner 
        assertEq(fundContract.owner(), address(this));

    }
}