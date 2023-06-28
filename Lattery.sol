// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

 contract L2{
    event l2(address manager , address payabls , uint value);
    address public manager;
    address payable[]public players;
    address public winner;
    uint amount;
    mapping(uint => address)public Winner;
    constructor(){
          manager = msg.sender;
    }
    function l21( uint _amount)public payable returns(bool){
         amount = _amount;
         require(msg.value > 1 ether);
         players.push(payable(msg.sender));
         return true;
             }

    function random()private view returns(uint){
                
     }

 }