// SPDX-License-Identifier: MIT
pragma solidity  0.8.16 ;
contract Bsystem{
    event Customerregistration(address indexed sender , address indexed owner, uint indexed txIndex);
    event depvosit(address indexed sender , uint amount , uint balance);
    event cashwithdrawal(address indexed sender, uint harvest , uint balance ); 
    event Lending(address indexed reqsuet , uint indexed txindex , uint amount);
    event moneytransfer(address indexed sender ,address indexed receiver , uint indexed txindex , uint amount);
    address[]public owners;
    mapping(address=> bool)public isowner;
    uint public ncr;
    address public richest;
    uint public mostSent;
    enum status{ Register , inventory , transaction , confirmrequest}
  transaction []Transactions ;
  function createtransation(address _to , uint _value , uint _nc , bytes calldata _data , bool _Excuted , status _st , uint _time , uint _txIndex ,uint _Operator)public{
transactions.push(transaction(_to , _value , _nc , _data , _Excuted , _st , _time , _txIndex , _Operator));
  }
  function getalltransactions()public view returns(transaction[] memory){
      return transactions;
  }

struct transaction{
        address to;
        uint value;
        uint nc;
        bytes data;
        bool Executed;
        status st ;
        uint time ;
        uint txIndex;
        uint Operator;
    }
    mapping(uint =>mapping(address=>bool))public isconfirmed;
     mapping(uint =>mapping(address=>bool))public Operator;
    mapping (address => uint) pendingWithdraws;
    transaction[]public transactions;
    modifier txexists(uint txindex){
for (uint i = 0 ; i <= transactions.length ; i++){
address owner = owners[i];
require(owner != address(0));
}
_;
    }  
    modifier onlyowner(){
        require(isowner[msg.sender]);
        _;
    }

modifier customerregistration(uint _txindex){
    require(!isconfirmed[_txindex][msg.sender]);
    _;
}
modifier notexecuted(uint _txindex){
    require(!transactions[_txindex].Executed);
    _;
}
constructor(address[]memory _owners , uint _ncr){
require(_owners.length > 0);
require (_ncr <= _owners.length && _ncr > 0);
for(uint i = 0 ; i < _owners.length ; i++){
    require(!isowner[_owners[i]]);
    isowner[_owners[i]] = true ;
}
ncr = _ncr;
}

receive()external payable{
    emit depvosit(msg.sender , msg.value , address(this).balance);
}

function CustomerregistrationS(address _to , uint _value , bytes memory _data , uint time , uint _Operator)public onlyowner{
    uint txIndex = transactions.length ;
    transactions.push(transaction({to:_to , value : _value , data :_data , Executed: false ,txIndex: txIndex, nc : 0 , st : status.Register , time : block.timestamp ,Operator : _Operator}));
    transaction storage trx = transactions[ txIndex ];
     require(block.timestamp - trx.time > 2 seconds);
     require(_Operator > 0);
     require(!Operator[txIndex][msg.sender]);
emit Customerregistration( msg.sender , _to , txIndex);
}
 function cashwithdrawals(uint txIndex , bytes memory data)public payable returns(bool ){
     transaction memory trx = transactions[ txIndex ];
     require(block.timestamp - trx.time > 2 seconds);
       require(msg.value > mostSent);
        pendingWithdraws[richest] += msg.value;
        richest = msg.sender;
        mostSent = msg.value;
        return true;
    
       
 }
 function  lending(address sender , bytes calldata data ,uint amount , uint _txIndex ,uint _Operator)public payable returns(bytes memory _data){
     transaction memory trx = transactions [ _txIndex ];
        require(block.timestamp - trx.time > 2 seconds);
         require(_Operator > 0);
        require(!Operator[_txIndex][msg.sender]);
        require(!isowner[owners[0]]);
        emit Lending(msg.sender , _txIndex , amount );

}

function Moneytransfer(address sender, address receiver, uint256 amount , uint txIndex , uint _Operator) external returns (bool) {
    transaction memory trx = transactions[txIndex];
    require(block.timestamp - trx.time > 2 seconds);
     require(_Operator > 0);
    require(!Operator[txIndex][msg.sender]);
    require(receiver != address(0));
    require(sender != address(0));
    address Isowner = msg.sender;
    return true ;

}

function gettransaction(uint _txindex)public view returns(address , uint , uint , bytes memory , bool){
    transaction memory trx = transactions[_txindex];
     require(block.timestamp - trx.time > 2 seconds);
    return(trx . to , trx.value , trx.nc , trx.data , trx.Executed);
}
    

}