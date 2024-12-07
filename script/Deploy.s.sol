// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {TestContract} from "../src/Web3.sol";

contract MyScript is Script{
    
    function run() external returns(TestContract){
        // // This loads in the private key from our .env file
        uint256 privateKey = vm.envUint("ANVIL_PRIVATE_KEY");

        // a special cheatcode that records calls and contract creations made by our main script contract.
        vm.startBroadcast(privateKey);
        
        // If we have constructor then passed the value in the function as params.
        // CREATED A NEW CONTRACT INSTANCE.
        TestContract token = new TestContract(msg.sender);
        
        vm.stopBroadcast();
        return token;
    }
}
 