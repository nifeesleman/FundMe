// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {priceConverter} from "./priceConverter.sol";
error NotOwner();
contract FundMe{
   using priceConverter for uint256;
    uint256 public minimumUsd=5e18;



    address [] public funders; 
    mapping (address funder => uint256 amountFunded) public addressToAmountFunder;
    address public owner;
    constructor(){
      owner = msg.sender;
    }
   function fund() public payable {

      //Allow user to send ether through minimem ether
      //How do we send ether
      
       require( msg.value.getConverstionRate() >= minimumUsd ,"Did't send enough fund");

       funders.push(msg.sender);
       // what is revert
       addressToAmountFunder[msg.sender]+=msg.value;
     
    }
   function withdraw() public onlyOwner {
   
    for(uint256 funderIndex= 0;funderIndex<funders.length;funderIndex++){
      address funder =funders[funderIndex];
      addressToAmountFunder[funder]=0;
    }
    funders =new address[](0);
    //call
    (bool callSuccess,)=payable(msg.sender).call{value: address(this).balance}("");
    require(callSuccess,"call failed");
    revert();
   }
   modifier onlyOwner(){
    //  require(msg.sender == owner,"Must be owner!");
    if(msg.sender != owner){revert NotOwner();}
     _;
   }

   receive() external payable {
    fund();
    }
    fallback() external payable {
    fund();
     }
}