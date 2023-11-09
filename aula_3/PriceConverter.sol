// SPDX-License-Identifier: MIT


pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// Working with a library we need to make our functions internal
library PriceConverter{
        function getPrice() internal view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 price,,,) = priceFeed.latestRoundData();

        return uint256(price) * 1e10; 
    } 

    function getConvertionRate(uint256 ethAmount) internal view returns(uint256) {
        // msg.value.getConvertionRate(); ( to do that, we need to create library)
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18; 
        return ethAmountInUsd;
    }

}
