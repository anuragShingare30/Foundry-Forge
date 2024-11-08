// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import "../src/Web3.sol";

contract Web3Test is Test{

    TestContract token;

    function setUp() public {
        token = new TestContract();
    }

    function testName() public view{
        console.log(token.name());
        assertEq(token.name(), "test");
    }

    function testGetName() public{ 
        token.setName("anurag");
        assertEq(token.getName(), "anurag");
    }
}