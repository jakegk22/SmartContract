// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract MyToken1 {
  address public creator;
  uint256 public totalSupply;
  mapping (address => uint256) public balances;

  constructor() {
    creator = msg.sender;
    totalSupply = 10000;
    balances[creator] = totalSupply;
  }

  function balanceOf(address owner) public view returns(uint256) {
    //uint balance = balances[owner];
    //return balance;
    return balances[owner];
  }

  function sendTokens(address receiver, uint256 amount) public returns(bool){
    address owner = msg.sender;
    require(amount > 0);
    require(balances[owner] >= amount);
    balances[owner] -= amount;
    balances[receiver] += amount;
    return true;
 }

 function getSupply() public view returns(uint256) {
   return totalSupply;
 }

}
