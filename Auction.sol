// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Carauction{
    event Auction( address highestBidder , uint HighestBidder );

    address payable  public  highestBidder ; 
    uint public  HighestBid ; 
     constructor() {
     highestBidder = payable (msg.sender);
     }
     
    function themost() public payable {
       require(msg.value > HighestBid , "There already is a higher bid.");
       
    }
    
}