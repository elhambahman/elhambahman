// SPDX-License-Identifier: MIT
pragma solidity 0.8.19 ;

    contract bank3{
     event Register(address indexed sender, address indexed Operator ,uint amount, bool success);
     event depvosit(address indexed sender , uint amount);
     event Moneytransfer(address indexed sender , address indexed Receiver , uint amount );
     event Withdraw(address indexed sender ,uint amount ,uint balance, bool success);
     
     mapping(address => bool)public isowner;
     mapping(address => uint)public balance;
     mapping(address => mapping(address => bool)) private receiver;
     sregister[]private sregisters;
     transaction[]private transactions;
     address public owner; 
     address payable received;


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
        function Deposit(uint _amount)public payable returns(uint){
            balance[msg.sender]+= _amount;
            emit depvosit(msg.sender , _amount);
            return balance[msg.sender];
        }

        function moneytransfer( address _received, uint _amount)public payable returns (bool){
              require(balance[msg.sender] >= _amount);
              (bool sent , ) = _received.call{value : _amount}("sent");
               require(sent , "Failed to complete");   
              return true;
        } 

        function WIthdraw( uint _amount)public payable returns(uint){
            require(balance[msg.sender] >= _amount);
            balance[msg.sender] -= _amount ;
              (bool sent , )= msg.sender.call{value : _amount}("sent");
              require(sent , "Failed to complete");  
              return balance[msg.sender];  
    }

     } 

    