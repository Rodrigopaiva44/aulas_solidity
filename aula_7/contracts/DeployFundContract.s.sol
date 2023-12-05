// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {FundContract} from "../src/FundContract.sol";

contract DeployFundContract is Script {

    function run() external{
        vm.startBroadcast();
        new FundContract();
        vm.stopBroadcast();
    }
}