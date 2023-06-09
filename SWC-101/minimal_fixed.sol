//Single transaction overflow
//Post-transaction effect: overflow escapes to publicly-readable storage
//Safe version
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract IntegerOverflowMinimal {
    uint public count = 1;

     function run(uint256 input) public {
        count = sub(count, input);        
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a); // SafeMath uses assert here
        return a - b;
    }
}