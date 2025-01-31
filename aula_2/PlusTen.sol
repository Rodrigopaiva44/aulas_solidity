// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {SimpleStorage} from "./SimpleStorage.sol";

contract PlusTen is SimpleStorage {
    function store(uint256 _number) public override {
        number = _number + 10;
    }
}
