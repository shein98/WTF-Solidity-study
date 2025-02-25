// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


contract ValueType {
    bool public _bool = false;

    int public _int = -1;

    uint public _uint = 2000;
    uint256 public number = 89898989;

    address public addr = 0x7A58c0Be72BE218B41C608b7Fe7C5bB630736C71;

    bytes32 public b32 = "MiniSolidity";
    bytes1 public b = b32[0];

    enum ActionSet {
        Buy,
        Hold,
        Sell
    }
    ActionSet action = ActionSet.Hold;
    // enum is a relatively obscure data type that almost no one uses.

    function enumToUint() external view returns(uint) {
        return uint(action);
    }
}