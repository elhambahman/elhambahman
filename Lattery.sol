// SPDX-License-Identifier: MIT

pragma solidity 0.8.18 ;
contract Lattery{
     event lattery(address manager , address [] players , uint value , bytes data);
     mapping(uint => address)public Winner;
     address public manager;
     address payable []public players;
     uint value ;

  
constructor(){
    manager = msg.sender;
}
//ثبت نام در لاتاری
function register(uint amount)public payable returns(bool){
    //1اتر واریز کنه
    amount = 1 ether;
     require(msg.value > 1 ether);
     //اضافه اش کن به شرکت کنندگان
     players.push(payable(msg.sender));
     return true;
    }
//انتخاب به صورت تصادفی
    function random()private view returns(uint){
      uint(keccak256(abi.encodePacked(block.timestamp,block.difficulty,msg.sender))) % 50000;
      abi.encodePacked(block.timestamp,block.difficulty,players.length);
        } 
//تعیین شماره برنده 
    function pickWinner()public {
     uint index = random() % players.length;
      players[index].transfer(address(this).balance);
      players = new address payable[](0);
     
    }
    
    function getplayers()public view returns(address payable[]memory){
      return players;
    }
     
}