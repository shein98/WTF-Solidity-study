// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract InsertionSort {
    function ifElseTest(uint256 _number) public pure returns (bool) {
        if (_number == 0) {
            return (true);
        } else {
            return (false);
        }
    }

    function forLoopTest() public pure returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < 10; i++) {
            sum += i;
        }
        return (sum);
    }

    function whileTest() public pure returns (uint256) {
        uint256 sum = 0;
        uint256 i = 0;
        while (i < 10) {
            sum += i;
            i++;
        }
        return (sum);
    }

    function doWhileTest() public pure returns (uint256) {
        uint256 sum = 0;
        uint256 i = 0;
        do {
            sum += i;
            i++;
        } while (i < 10);
        return (sum);
    }

    //  ternary/conditional operator
    function ternaryTest(uint256 x, uint256 y) public pure returns (uint256) {
        // return the max of x and y
        return x >= y ? x : y;
    }

    function insertionSort(uint256[] memory numbers) public pure returns(uint[] memory ) {
        require(numbers.length > 0, "cannot sort an empty array!");
        for (uint256 i = 1; i < numbers.length; i++) {
            uint256 key = numbers[i];
            uint256 j = i - 1;
            while (j > 0 && key < numbers[j]) {
                numbers[j + 1] = numbers[j];
                j--;
            }

            numbers[j+1] = key;
            
        }
        return numbers;
    }
}
