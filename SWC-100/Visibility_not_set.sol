/*
* @source: https://github.com/sign/solidity-security-blog#visibility
* @author: SigmaPrime
* Modified by Gerhard Wagner
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


/**
    contract HashForEther {
            function withdrawWinnings() {
            // Winner if the last 8 hex characters of the address are 0,
            require(uint32(msg.sender) == 0);
            _sendWinnings();
        }

        function _sendinnings() {
            msg.sender.transfer(this.balance);
        }
    }
*/

// Solution: Use Public keyword to specify visibility

contract SHashForEther {

    function SwithdrawWinnings() public {
        // Winner if the last 8 hex characters of the address are 0,
        require(uint64(msg.sender) & 0xffffffffffffffff == 0);
        _SsendWinnings();
    }

    function _SsendWinnings() public {
        payable(msg.sender).transfer(address(this).balance);
    }
}