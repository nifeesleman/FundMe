// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract FundMe{

    uint256 public myValue=1;
    function fund() public payable {

      //Allow user to send ether through minimem ether
      //How do we send ether
       myValue+=2;
       require( msg.value > 1e18 ,"Did send enough fund");
       // what is revert
    

    }
}