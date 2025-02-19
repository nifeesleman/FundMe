// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract safeMathTester{
    uint8 public bigNumber=255;

    function add( )public {
        bigNumber+=1;
    }
}