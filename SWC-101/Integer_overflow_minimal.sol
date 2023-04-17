// Single transaction overFlow
// Post-transaction effect overflow escapes to publicly-readable storage
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract IntegerOverflowMinimal {
    uint public count = 1;

    function run(uint256 input) public {
        count -= input;
    }
}
