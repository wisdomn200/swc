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

// Multiplication Overflow

contract IntegerOverflowMul {
    uint public count = 2;

    function run(uint256 input) public {
        count *= input;
    }
}

// Multiplication Overflow fixed


contract SolOverflowMul {
     uint public count = 2;

    function run(uint256 input) public {
        count = mul(count, input);
    }

    // Safe Math
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, 
        // but the benefit is lost if 'b' is also tested. 
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        require(c / a == b);

        return c;
    }
}


// Multi-transactional, Multi-fuction
// Arithmetic instruction reachable

contract Feasible {
    uint256 private initialised = 0;
    uint256 public count = 1;

    function init() public {
        initialised = 1;
    }

    function run(uint256 input) {
        if (initialised == 0) {
            return;
        }

        count -= input;
    }

// Multi-transactional, Multi-fuction solution
// Arithmetic instruction reachable

contract FeasibleSol {
    uint256 private initialised = 0;
    uint256 public count = 1;

    function init() public {
        initialised = 1;
    }

    function run(uint256 input) {
        if (initialised == 0) {
            return;
        }

        count = sub(count, input);
    }

    // from SafeMath
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);  //SafeMath uses assert here
        return a - b;
    }
    
  }
      
    // OneFuncFeasible
    contract OneFuncFeasible {
        uint256 private initialised = 0;
        uint256 public count = 1;

        function run(uint256 input) public {
            if (initialised == 0) {
                initialised = 1;
                return;
            }

            count -= input;
        }
    }

    // OneFuncFeasibleSol
    contract OneFuncFeasibleSol {
        uint256 private initialised = 0;
        uint public count = 1;
        
        function run(uint256 input) public {
            if(initialised == 0) {
                initialised = 1;
                return;
            }
            count = sub(count, input);
        }

        // From SafeMath
        function sub(uint256 a, uint256 b) internal pure returns (uint256) {
            require(b <= a); //SafeMath uses assert here
            return a - b;
        }
    }

    // Infeasible

    contract Infeasible {
        uint256 private initialised = 0;
        uint256 public count = 1;

        function run(uint256 input) public {
            if (initialised == 0) {
                return;
            }

            count -= input;
        }
    }

    // Addition

    contract Overflow_Add {
        uint public balance = 1;
        function add(uint256 deposit) public {
            balance += deposit;
        }
    }

    // Addition Sol

    contract Add {
        uint public balance = 1;

        function add(uint256 deposit) public {
            balance = add(balance, deposit);
        }

        // SafeMath
        function add(uint256 a, uint256 b) internal pure returns (uint256) {
            uint256 c = a + b;
            require(c >= a);

            return c;
        }
    }


}