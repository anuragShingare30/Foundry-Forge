// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/Web3.sol";

contract Web3Test is Test{

    TestContract token;

    function setup() public {
        token = new TestContract();
    }

    function testName() public view{
        assertEq(token.name(), "test");
    }
}