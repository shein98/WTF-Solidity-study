// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract DataStorage {
    /*
        There are three types of data storage location in Solidity: storage, memory, and calldata. The gas costs associated with different storage location vary.
        Data of type storage exists on-chian, similar to a computer's hard drive, and the consumes a lot of gas, whereas memory and calldata types temporarily exsit
        in memory and consume less gas. The overall gas consumption, form highest to lowest, is: Storage > memmory > calldata. General usage:
            - storage: The state variable in contrats are by default of storage type and stored on-chain.
            - memory: Function Paramaters and temporary variables are generally of memory type, not on-chain. Especially if the return data type is variable-length, it 
                      must be specified with memory, such as: string, bytes, array and custom strutures.
            - calldata: Similar to memory, stored in memory and not on-chain. The difference from memory is that calldata variables cannot be modified(immutable) and are 
                    generally used for function paramaters.
    */

    function fCalldata(uint[] calldata x) public pure returns (uint[] calldata) {
        return(x);
    }

    // when assigning a storage (contract's state variable) to a local storage(with a function), a reference is created, and changing the new variable will affect the 
    // original variable Example:
    uint[] _x = [1, 2, 3];
    function fStorage() public {
        uint[] storage xStorage = _x;
        xStorage[0] = 100;
    }

    // state variable
    uint public x = 1;
    uint public y;
    string public z;

    // The value of the state variable can be changed in the function.
    function foo() external {
        x = 5;
        y = 2;
        z = "0xAA";
    }

    // local variable
    function bar() external pure returns(uint){
        uint xx = 1;
        uint yy = 3;
        uint zz = xx + yy;
        return(zz);
    }

    // global variable
    function global() external view returns(address, uint, bytes memory){
        address sender = msg.sender;
        uint blockNum = block.number;
        bytes memory data = msg.data;
        return(sender, blockNum, data);
    }

    // Ether uint
    function weiUnit() external pure returns(uint) {
        assert(1 wei == 1e0);
        assert(1 wei == 1);
        return 1 wei;
    }

    function gweiUnit() external pure returns(uint) {
        assert(1 gwei == 1e9);
        assert(1 gwei == 1000000000);
        return 1 gwei;
    }

    function etherUnit() external pure returns(uint) {
        assert(1 ether == 1e18);
        assert(1 ether == 1000000000000000000);
        return 1 ether;
    }

    /*
        time unit
        seconds: 1
        minutes: 60 seconds = 60
        hours: 60 minutes = 3600
        days: 24 hours = 86400
        weeks: 7 days = 604800
    */ 
    function secondsUnit() external pure returns(uint) {
        assert(1 seconds == 1);
        return 1 seconds;
    }

    function minutesUnit() external pure returns(uint) {
        assert(1 minutes == 60);
        assert(1 minutes == 60 seconds);
        return 1 minutes;
    }

    function hoursUnit() external pure returns(uint) {
        assert(1 hours == 3600);
        assert(1 hours == 60 minutes);
        return 1 hours;
    }

    function daysUnit() external pure returns(uint) {
        assert(1 days == 86400);
        assert(1 days == 24 hours);
        return 1 days;
    }

    function weeksUnit() external pure returns(uint) {
        assert(1 weeks == 604800);
        assert(1 weeks == 7 days);
        return 1 weeks;
    }

        
}