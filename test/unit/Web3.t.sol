// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";

error Unauthorized();

contract Web3Contract{
    address public owner;
    uint public count;

    constructor(){
        owner = msg.sender;
    }

    function increase() public {
        if(msg.sender != owner){
            revert Unauthorized();
        }
        count++;
    }
}

contract Web3Test is Test{
    Web3Contract token;
    
    function setUp() external {
        token = new Web3Contract();
    }

    function test_increament() public {
        assertEq(token.count(),0);
        token.increase();
        assertEq(token.count(),1);
    }

    function testFail_IncrementAsNotOwner() public {
        vm.expectRevert("Niche ka function pass nahi hora hai!!!");
        vm.prank(address(0));
        token.increase();
    }
}


// 1. UNIT TESTING - TESTING A SPECIFIC PART OF OUR CODE.
// 2. INTEGRATION TEST - INTEGRATING SC A TESTING SPECIFIC PORTION.
// 3. FORKED TEST - TESTING OUR CODE ON A SIMULATED REAL ENVIRONMENT.
// 4. STAGING TEST - TESTING OUR CODE IN TESTNET/MAINNET. EX:- SEPOLIA, ANVIL LOCAL TESTING


// // TO LOAD THE .env CONTENT
// source .env
// echo $RPC_URL

// // TESTING SC
// forge test -vvv
// forge test --fork-url $RPC_URL

// // TO RUN THE SINGLE TEST
// forge test --mt testBalance -vvv --fork-url $RPC_URL

// // CONVERGING SC -> This command displays which parts of your code are covered by tests.
// forge converge --fork-url $RPC_URL   

// // DEBUGGING SC
// forge debug --debug src/Web3.sol:TestContract --sig "setName()" "anurag"

// // Forge can remap dependencies to make them easier to import. Forge will automatically try to deduce some remappings for you:
// forge remappings


