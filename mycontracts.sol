// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
 import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract MyToken  {
        IERC20 public token ;


    constructor(address tokenAddress) {
         token = IERC20(tokenAddress);

    }
function getTotalSupply()public view returns(uint){
  return token.totalsupply();
}
  
}