// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Event {
    // Define the _balances mapping variable to record the amount of tokens held by each address.
    mapping(address => uint256) public _balance;

    event Transfer(address indexed from, address indexed to, uint256 value);

    function _transfer(address from, address to, uint256 value) external  {
        _balance[from] = 100000;
        _balance[from] -= value;
        _balance[to] += value;
        emit Transfer(from, to, value);
    }
}