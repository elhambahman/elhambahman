// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
 import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
        IERC20 public token ;


    constructor(address tokenAddress)ERC20("My Token", "MTK") {
         _mint(msg.sender, 1000000 * 10 ** decimals());
         token = IERC20(tokenAddress);

    }

    function mint(address account, uint256 amount) public{
        _mint(account , amount);
    }
}