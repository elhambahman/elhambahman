// SPDX-License-Identifier: MIT
pragma solidity 0.8.19 ;

contract Oilcompany{
    event Dailyproduction(uint barrel ,uint price,  uint timestamp );
    event Shareholders(address indexed shareholders, uint percentage, uint timestamp);
    event interestpayment(uint paymentAmount, uint paymentDate, string paymentMethod);
    event Transferofshares( address indexed to, uint amount, uint timestamp);
    mapping(address => bool)private shareholder;
    mapping(address => uint) private shares;
    uint private totalShares;
    uint private numShareholders;

  struct company{
    uint barrel ;
    uint price;
    uint paymentAmount ;
    uint paymentDate;
    uint percentage;
    uint amount;
    uint timestamp;
    uint totalShares ;
    address to;
    address chairman ;
    string paymentMethod;
  }
  company[] oil ;

  function addcompany(uint _barrel,uint _price , uint _paymentAmount , uint _paymentDate , uint _percentage , uint _amount , uint _timestamp ,uint _totalShares , address _to,address _chairman , string memory _paymentMethod) public{
    oil.push(company({barrel : _barrel , price : _price , paymentAmount : _paymentAmount , paymentDate : _paymentDate , percentage : _percentage , amount : _amount , timestamp : _timestamp ,totalShares : _totalShares , to : _to , chairman : _chairman, paymentMethod : _paymentMethod }));
  }
 
 function recordDailyProduction(uint timestamp)public returns(uint , uint , uint){
       uint barrel = 100000 ;
       uint  price = 90 ;
       emit Dailyproduction(barrel , price,  timestamp );
       return (barrel , price , timestamp);
 }
 
 function getShareholders(address shareholders ,address chairman , uint percentage ,uint sharesAmount, uint timestamp)public returns(bool){
     require(shareholder[msg.sender] || chairman == msg.sender ,"This request is not allowed" );
       sharesAmount = shares[shareholders];
       emit Shareholders(shareholders, percentage, timestamp);
       return true;
 }

 function getInterestPayment(uint profit, uint sharesAmount, uint percentage) public pure returns(uint) {
    uint interestPayment = profit * percentage / 100 / sharesAmount;
    return interestPayment;
}

function ChangeShareholders( address chairman , address to ,uint sharesAmount, uint amount , uint timestamp)public returns(bool){
  require( to != address(0) , "The address is wrong" );
  require(chairman != address(0), "Chairman is not set");
  require(chairman == msg.sender || shareholder[msg.sender] , "This request is not allowed");
  require(amount > 0 && amount <= sharesAmount , "More than the limit");
  shares[msg.sender] = sharesAmount - amount;
  shares[to] += amount;
  emit Transferofshares(to ,amount, timestamp);
  return true;
}
}
