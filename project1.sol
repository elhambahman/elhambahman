// SPDX-License-Identifier: MIT
pragma solidity 0.8.19 ;
import "https://github.com/metafy-social/web3-smart-contracts/blob/10ac898f2a6d9b094f2e08af5daa07887e640807/contracts/Misc/Vesting_Contract.sol#L37";
library incanddec{
    function inc(uint a)internal pure returns(uint){
        return a++ ;
    }
    function dec(uint a)internal pure returns(uint){
        return a--;
    }
}


contract msw {
event Deposit(address indexed sender , uint amount , uint balance);
event submittransaction(address indexed owner, uint indexed txindex , address indexed to);
event confirmtransaction(address indexed owner , uint indexed txindex);
event Revokecanfirmation(address indexed owner , uint indexed txindex);
event Executetransaction(address indexed owner , uint indexed txindex);
address[]public owners;
mapping(address=> bool)public isowner; 
uint public ncr;
string password ;
enum status{submited , waitingforconfirm , Executed}
struct transaction{
    address to;
    uint value ; 
    bytes data ;
    bool Executed ; 
    uint nc; 
    status st;
} 
mapping(uint => mapping(address => bool))public isconfirmed;
transaction[]public transactions; 

modifier onlyowner(){
    require (isowner [msg.sender]) ;
    _;
}

modifier txexists(uint _txindex){
    require( _txindex < transactions.length);
    _;
}
modifier notexecuted(uint _txindex){
    require (transactions [ _txindex ].Executed) ;
    _;
}

modifier notconfimed(uint _txindex){
    require(!isconfirmed[_txindex][msg.sender]);
    _;
}
constructor(address [] memory _owners , uint _ncr , string memory _password){
    require ( _owners .length > 0 );
    require(_ncr <= _owners.length && _ncr > 0);
    for(uint i = 0 ; i < _owners.length ; i ++){
        address owner = _owners [i] ;
        require (owner != address (0));
        require (! isowner [owner]);
        isowner [owner] = true ; 
        owners.push(owner);
        password = _password;

    }
    ncr = _ncr ; 
}
receive ()external payable{
    emit Deposit(msg.sender , msg.value , address(this).balance);
}

function submittransactions(address _to , uint _value , bytes memory _data)public payable onlyowner{
    require (msg.value >= 1 ether);

   uint txindex = transactions.length ; 
   transactions.push(transaction({to :_to , value:_value , data :_data , Executed :false , nc : 0 , st : status.submited}));

   emit submittransaction(msg.sender , txindex , _to);
}
 function confirmtransactions(uint _txindex)public onlyowner txexists(_txindex) notexecuted(_txindex) notconfimed(_txindex){
transaction storage trx = transactions[_txindex];
trx.nc = incanddec.inc(trx.nc);
isconfirmed[_txindex][msg.sender]=true ;
trx.st = status .waitingforconfirm ;
emit confirmtransaction(msg.sender , _txindex);
 }

 function executetransaction(uint _txindex , string memory pass)public onlyowner txexists(_txindex) notexecuted(_txindex){
     require(keccak256 (bytes(pass)) == keccak256 (bytes(password)));
     transaction storage trx = transactions[_txindex];
     require (trx.nc >= ncr);
     (bool c ,  ) = trx.to.call{value : trx.value}(trx.data);
     trx.Executed = true;
     trx.st = status. Executed ;
     require (c , "trx failed");
     emit Executetransaction(msg.sender , _txindex);
 }
 function revokecanfirmation(uint _txindex)public onlyowner txexists(_txindex) notexecuted(_txindex){
transaction storage trx = transactions [ _txindex ]; 
     require (isconfirmed[_txindex][msg.sender]);
     trx.nc = incanddec .inc(trx.nc) ;
   isconfirmed [_txindex][msg.sender]= false ;
   emit Revokecanfirmation(msg.sender , _txindex);

 }
 function gettransaction(uint _txindex)public view returns(address , uint , bytes memory , bool , uint ){
transaction memory trx = transactions [_txindex];
return(trx.to , trx.value , trx.data , trx.Executed , trx.nc);
 }

}