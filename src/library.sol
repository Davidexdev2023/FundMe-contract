// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getPrice (AggregatorV3Interface dataFeed) internal view returns(uint256) {
    (, int price,,,) = dataFeed.latestRoundData();
     require(price > 0, "Invalid price from oracle");
        
        return uint256(price ); 
    }

    function getconversion(uint256 amountSent, AggregatorV3Interface dataFeed) internal  view returns (uint256) {
        uint256 ethToUsd = getPrice(dataFeed);
        uint256 ethtoUsdSent = (ethToUsd * amountSent) /1e18;
        return (ethtoUsdSent);
    }

}