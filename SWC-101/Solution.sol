// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract IntegerOverflowMappingSym1 {
    mapping(uint256 => uint256) map;

    function init(uint256 k, uint256 v) public {
        map[k] = sub(map[k], v);
    }

    // From SafeMath
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a); // SafeMath uses assert here
        return a - b;
    }
}