// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {TestContract} from "../src/Web3.sol";

contract Web3Test is Test{

    TestContract token;

    function setUp() external {
        // NEW SC INSTANCE
        token = new TestContract();
    }

    function testSetName() public view{
        console.log(token.name());
        assertEq(token.name(), "test");
    }

    function testGetName() public{ 
        token.setName("anurag");
        assertEq(token.getName(), "anurag");
    }
}


// forge test -vvv
// forge debug --debug src/Web3.sol:TestContract --sig "setName()" "anurag"