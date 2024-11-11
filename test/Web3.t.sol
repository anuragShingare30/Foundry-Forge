// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {TestContract} from "../src/Web3.sol";
import {MyScript} from "../script/Deploy.s.sol";

contract Web3Test is Test{

    TestContract token;

    function setUp() external {
        // BY THIS WAY WE NEED TO JUST UPDATE THE DEPLOY SCRIPT
        // NEW SC INSTANCE
        MyScript myscript = new MyScript();
        token = myscript.run();
    }

    function testBalance() public view {
        console.log(token.publicMintOpen());
        assertEq(token.publicMintOpen(), false);
    }

    function testMint() public{
        vm.expectRevert();
        token.publicMint();
    }

    
}


// 1. UNIT TESTING - TESTING A SPECIFIC PART OF OUR CODE.
// 2. INTEGRATION TEST - INTEGRATING SC A TESTING SPECIFIC PORTION.
// 3. FORKED TEST - TESTING OUR CODE ON A SIMULATED REAL ENVIRONMENT.
// 4. STAGING TEST - TESTING OUR CODE IN TESTNET/MAINNET



// TESTING SC
// forge test -vvv
// forge test --fork-url $RPC_URL

// TO RUN THE SINGLE TEST
// forge test -m testBalance -vvv --fork-url $RPC_URL

// CONVERGING SC - This command displays which parts of your code are covered by tests.
// forge converge --fork-url $RPC_URL

// DEBUGGING SC
// forge debug --debug src/Web3.sol:TestContract --sig "setName()" "anurag"

// Forge can remap dependencies to make them easier to import. Forge will automatically try to deduce some remappings for you:
// forge remappings