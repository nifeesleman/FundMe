// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract FundMe{

    uint256 public minimumUsd=5;
    function fund() public payable {

      //Allow user to send ether through minimem ether
      //How do we send ether
      
       require( msg.value >= minimumUsd ,"Did't send enough fund");
       // what is revert
    

    }
    function getPrice() public {}
    function getConverstionRate() public {}
}