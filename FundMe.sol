// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


contract FundMe{

    uint256 public minimumUsd=5e18;

    address [] public funders; 
    
    
   function fund() public payable {

      //Allow user to send ether through minimem ether
      //How do we send ether
      
       require( msg.value >= minimumUsd ,"Did't send enough fund");

       funders.push(msg.sender);
       // what is revert
    
     
    }
    function getPrice() public view returns(uint256) {
       AggregatorV3Interface priceFeed= AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
       (, int256 answer,,,)= priceFeed.latestRoundData();

       return uint256(answer*1e10);
    }
    function getConverstionRate(uint256 ethAmount) public view returns(uint256)  {
      uint256 ethPrice =getPrice();
      uint256 ethAmountInUsd=(ethPrice*ethAmount)/1e18;
      return ethAmountInUsd;
    }
    //Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
    function getVersion() public  view returns (uint256) {
      return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}