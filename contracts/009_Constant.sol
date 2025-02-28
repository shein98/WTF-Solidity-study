// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract Constant {
    // constant variable must be initialized at the time of declaration and  cannot be changed afterwards. 
    uint256 constant CONSTANT_NUM = 10;
    string constant CONSTANT_STRING = "0xAA";
    bytes constant CONSTANT_BYTES = "WTF";
    address constant CONSTANT_ADDRESS = 0x0000000000000000000000000000000000000000;



    // immutable variable can be initialized in the constructor ,and cannot be changed afterwards.
     uint256 public immutable IMMUTABLE_NUM = 9999999999;
    // In solidity v8.9.21 and later, the following variable are currently set to their initail values.
    address public immutable IMMUTABLE_ADDRESS; 
    uint256 public immutable IMMUTABLE_BLOCK;
    uint256 public immutable IMMUTABLE_TEST;

    // Using constructors to initilized immutable variables.
    constructor(){
        IMMUTABLE_ADDRESS = address(this);
        IMMUTABLE_NUM = 1118;
        IMMUTABLE_TEST = test();
    }

    function test() public pure returns(uint256){
        uint256 what = 9;
        return(what);
    }
}