pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {FundContract} from "../src/FundContract.sol";

contract FundContractTest is Test {
    FundContract fundContract;
    function setUp() external{
        fundContract = new FundContract();
    }

    function testMinimumDolarIsFive() public {
        assertEq(fundContract.minUsd(), 5e18);
    }

    function testOnwerIsMsgSender() public{
        console.log(fundContract.owner());
        console.log(msg.sender); // we are calling this function
        assertEq(fundContract.owner(), address(this)); // this contract is deploying the new FundContract.
    }

}   