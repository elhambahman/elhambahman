// SPDX-License-Identifier: MIT
pragma solidity 0.8.19 ;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
contract bank2 is ERC20{
 event Customerregistration(address indexed sender ,address indexed operator, uint indexed txIndex);
 event depvosit(address indexed sender , uint amount);
 event cashwithdrawal(address indexed sender, uint amount , uint balance ); 
 event Lending(address indexed sender , uint indexed txIndex , uint amount );
 event moneytransfer(address indexed sender ,address indexed received , uint indexed txIndex , uint amount);

 mapping(address => bool)public isowner;
 mapping(address => uint)private balance;
  mapping(address => uint)public Awaitingpayment;
  mapping(uint =>mapping(address=>bool))public Operator;
  mapping(uint => mapping(address => bool))public isconfirmed;
  address[] public owners ;  
  transaction[]public transactions;
  person[]public Persons;
  uint public ncr;
    enum status{ Register , inventory , transaction , confirmrequest}
   struct transaction{
         address to ; 
         uint value;
         bytes data; 
         bool Executed;
         uint nc; 
         uint Operator;
         uint txIndex;
         status st;
         uint time ;

        }

    struct person{
         string name ;
         uint nn;
         uint Account;
         address owner;
        uint amount;

        }

    modifier Validaddress(uint nn){
          require(msg.sender != address(0));
        require(isowner[msg.sender]);
                  _;
            }

    modifier customerregistration(uint _txindex){
        require(!Operator[_txindex][msg.sender] , "Awaiting confirmation");
          _;
        }

    modifier notexecuted(uint _txindex){ 
        require(!transactions[ _txindex ].Executed);
          _;
    }

    modifier onlyOwner() {
    require(isowner[msg.sender]);
    _;
    }
    constructor(address[]memory _owners , uint _ncr ) ERC20 ("name" ,"symbol"){
    require(_owners.length > 0);
    require (_ncr <= _owners.length && _ncr > 0);
    owners = [msg.sender];
    for(uint i = 0 ; i < _owners.length ; i++){
    require(!isowner[_owners[i]]);
    isowner[_owners[i]] = true ;
    }
    ncr = _ncr;

    }
      receive()external payable{
         emit depvosit(msg.sender , msg.value );
    }

    function createtransation(address _to , uint _value , bytes memory _data ,bool _Executed, uint _nc , uint _Operator , uint _txIndex , status _st , uint _time )public{
transactions.push(transaction(_to , _value ,_data , _Executed ,_nc, _Operator, _txIndex, _st , _time));
    }

    function gettransaction()public view returns(transaction[] memory){
      return transactions; 
    }
    function CustomerregistrationS( address _to , uint _value , bytes memory _data , uint _nc , uint _Operator , uint txIndex )public payable onlyOwner{
          require( _Operator > 0);
         require(!transactions[ txIndex ].Executed);
        transaction storage trx = transactions[ txIndex ];
        require(block.timestamp - trx.time > 2 seconds);
         uint _txIndex = transactions.length;
         transactions.push( transaction({ to: _to , value : _value , data : _data , Executed : false ,nc : _nc , Operator: _Operator, txIndex : _txIndex , st : status.Register , time: block.timestamp}));
         balance[msg.sender] +=2 ether;
         Operator[txIndex][msg.sender]= true;
         emit Customerregistration( msg.sender , _to , txIndex);
    }

    function Depvosit(uint _txIndex)public payable returns(uint){
        require((balance[msg.sender] + msg.value) >= balance[msg.sender]);
        balance[msg.sender] += msg.value;
         emit depvosit(msg.sender , msg.value );
          transaction storage trx = transactions[ _txIndex ];
         require(block.timestamp - trx.time > 2 seconds);
        return balance[msg.sender];
}

    function Cashwithdrawal(uint amount , uint txIndex)public payable returns(uint){
         require(amount <= balance[msg.sender], "Insufficient inventory");
         balance[msg.sender] -= amount;
        (bool sent, )= msg.sender.call{value : amount}("sent");
         require( sent , "Failed to complete");
          transaction storage trx = transactions[ txIndex ];
          require(block.timestamp - trx.time > 2 seconds);
          return(balance[msg.sender]);

     }

    function lending(uint amount , uint _txIndex)public payable returns(bool){
        require(Operator[_txIndex][msg.sender]);
        balance[msg.sender] += 10 ether;
        balance[msg.sender]+= msg.value;
         transaction storage trx = transactions[ _txIndex ];
        require(block.timestamp - trx.time > 2 seconds);
        (bool sent , )=msg.sender.call{value : amount}("sent");
        require( sent , "Failed to complete");
        emit Lending(msg.sender , _txIndex , amount );
        return true;
     }

    function Moneytransfer(address sender , uint txindex, address received  , uint amount )public payable returns(uint){
         require(amount <= balance[msg.sender] , "Your inventory is insufficient");
        (bool sent , )=msg.sender.call{value : amount}("sent");
         require( sent , "Failed to complete");
        transaction storage trx = transactions[ txindex ];
        require(block.timestamp - trx.time > 2 seconds);
         balance[msg.sender] -= amount;
         balance[msg.sender] -=msg.value;
         emit moneytransfer(msg.sender ,received , txindex , amount);
    } 
    function getalltransactions(uint _txIndex)public view returns(address , uint , bytes memory , bool ,uint , uint ){
         transaction storage trx = transactions[ _txIndex ];
        require(block.timestamp - trx.time > 2 seconds);
         return(trx.to , trx.value ,trx.data, trx.Executed , trx.nc, trx.txIndex);
    }

    function Balences()public view returns(uint){
         return balance[msg.sender];
    }


}