// SPDX-License-Identifier: MIT
pragma solidity 0.8.18 ;
    contract bank3{
     event Register(address indexed sender, address indexed Operator ,uint amount, bool success);
     event depvosit(address indexed sender , uint amount);
     event Moneytransfer(address indexed sender , address indexed Receiver , uint amount );
     event Withdraw(address indexed sender ,uint amount ,uint balance, bool success);
     event Lending(address indexed sender , uint amount ,uint balance, bool success);
     //تایید اورنر
     mapping(address => bool)public isowner;
     //مشخص شدن موجودی
     mapping(address => uint)public balance;
     mapping(address => mapping(address => bool)) private receiver;
     sregister[]private sregisters;
     transaction[]private transactions;
     address public owner;
     address public received;

struct sregister{
    address to ;
    string name ;
    string gender;
    uint Contact;
    uint nn ; 
    uint birth;
    uint amount;
}
struct transaction{
     address sender ;
     address Receiver;
     bytes data;
     uint nc; 
     uint nn;
     uint balance;
     uint account;
     uint amount;
     uint Operator;
     uint txIndex;
}


     receive ()external payable{
     emit depvosit(msg.sender , msg.value );
      }

      function settransaction(address _sender , address _Receiver , bytes calldata _data , uint _nc ,uint _nn , uint _balance, uint _account , uint _amount, uint _Operator , uint _txindex )public{
         transactions.push(transaction(_sender , _Receiver , _data , _nc , _nn, _balance, _account, _amount,  _Operator, _txindex));

      }

      function gettransaction()public view returns(transaction[] memory){
            return transactions;
      }

 
        function  setregister(address _to ,string memory _name , string memory _gender,uint _Contact, uint _nn , uint _birth ,uint _amount )public{
            sregisters.push(sregister(_to , _name , _gender , _Contact , _nn, _birth , _amount ));
                    }
        
        function getsregister()public view returns(sregister[] memory){
            return sregisters;
        }

        function moneytransfer(address sender , uint amount)public payable returns (bool){
              balance[msg.sender] += amount;
              balance[msg.sender] >= amount ;
              balance [msg.sender] -= amount ;
              if(owner == received){
                 balance[received] += amount;
              }
              else{
              (bool sent , ) = received.call{value : amount}("sent");
              require(sent , "Failed to complete");   
              }
              return true;
        }

        function WIthdraw(address sender , uint amount)public payable returns(uint){
              balance [msg.sender] -= amount ; 
              (bool sent , )= msg.sender.call{value : amount}("sent");
              require(sent , "Failed to complete") ;    
              return balance[msg.sender];         
    }
    }