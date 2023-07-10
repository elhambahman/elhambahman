// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
 import "./IERC20.sol";
contract mycontract  {
        IERC20 public token ;


    constructor(address tokenAddress) {
         token = IERC20(tokenAddress);

    }
  

function getTotalSupply()public view returns(uint){
  return token.totalSupply();
}

    function getbalanceOf(address account)public view returns (uint){ 
    return token.balanceOf(account);

    }
    function  gettransfer(address recipient, uint amount)public  returns(bool){
     token.transfer(recipient , amount );
     return true;    
    }

    function getallowance(address owner, address spender) public view returns (uint){
          return token.allowance(owner,spender);

    }
    function getapprove(address spender, uint amount) public returns (bool){
       token.approve(spender , amount);
       return true;
    }

    function Mint( uint amount)public returns(bool){
      token.mint(amount);
      return true;
       }


}