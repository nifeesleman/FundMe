// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {priceConverter} from "./priceConverter.sol";

contract FundMe{
   using priceConverter for uint256;
    uint256 public minimumUsd=5e18;



    address [] public funders; 
    mapping (address funder => uint256 amountFunded) public addressToAmountFunder;
    
   function fund() public payable {

      //Allow user to send ether through minimem ether
      //How do we send ether
      
       require( msg.value.getConverstionRate() >= minimumUsd ,"Did't send enough fund");

       funders.push(msg.sender);
       // what is revert
       addressToAmountFunder[msg.sender]+=msg.value;
     
    }
   function withdraw() public {
    for(uint256 funderIndex= 0;funderIndex<funders.length;funderIndex++){
      address funder =funders[funderIndex];
      addressToAmountFunder[funder]=0;
    }
    funders =new address[](0);
   }
}