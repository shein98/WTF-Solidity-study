// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

abstract contract InsertionSort {
    function insertionSort(uint256[] memory a)
        public
        pure
        virtual
        returns (uint256[] memory);
}

