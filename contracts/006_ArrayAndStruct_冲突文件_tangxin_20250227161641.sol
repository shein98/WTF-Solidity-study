// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ArrayAndStruct {
    // Fixed-length array
    uint256[8] array1;
    bytes1[5] array2;
    address[100] array3;

    // dynamic array
    uint256[] array4;

    // For dynamically sized arrays modified by memory, you can create them using the new operator, but you can declare the length.
    // and the length cannot be changed after declaration. Example:

    // SPDX-License-Identifier: GPL-3.0
    function f() public pure {
        g([uint256(1), 2, 3]);
    }

    function g(uint256[3] memory _data) public pure {
        // ...
    }

    // struct
    struct Student {
        uint256 id;
        uint256 score;
    }

    Student student; // 初始一个student结构体
}
