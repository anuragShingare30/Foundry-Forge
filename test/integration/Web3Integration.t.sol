// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";


contract Web3Integration is Test{
    
    uint num = 100;
    function integrationTest(uint number) public {
        num = number;
        assertEq(num,10);
    }
}