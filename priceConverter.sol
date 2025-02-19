// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library priceConverter{
     function getPrice() internal view returns(uint256) {
       AggregatorV3Interface priceFeed= AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
       (, int256 answer,,,)= priceFeed.latestRoundData();

       return uint256(answer*1e10);
    }
    function getConverstionRate(uint256 ethAmount) internal view returns(uint256)  {
      uint256 ethPrice =getPrice();
      uint256 ethAmountInUsd=(ethPrice*ethAmount)/1e18;
      return ethAmountInUsd;
    }
    //Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
    function getVersion() internal  view returns (uint256) {
      return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}