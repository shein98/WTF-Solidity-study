// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Modifier {
    address owner; // Define the owner variable.

    constructor(address initialOwner) {
        owner = initialOwner;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function changeOwner(address _newOwner) external onlyOwner {
        owner = _newOwner; 
    }
}
