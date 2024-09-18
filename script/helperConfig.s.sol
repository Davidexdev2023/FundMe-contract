// SPDX-License-Identifier: SEE LICENSE IN MIT
pragma solidity 0.8.18;
import {Script} from "forge-std/Script.sol";
import {MockV3Aggregator} from "../test/mock/AggregatorMock.sol" ;

contract HelperConfig is Script {   

      uint8 decimals = 8;
      int256 initialAnswer = 2000e8;

     struct networkConfig {
        address networkAddress;
     }
     networkConfig private activeNetWotkConfig;

     constructor () {
        if(block.chainid == 11155111){
            activeNetWotkConfig = EthSepoliaNetworkConfig();
        } else if (block.chainid == 1) {
            activeNetWotkConfig = EthMainNetworkConfig();
        }else{
            activeNetWotkConfig = AnvilNetworkConfig();
        }
     }

    // for ethereum mainnet
     function EthMainNetworkConfig() public pure returns(networkConfig memory) {
        networkConfig memory EthMainNetwork = networkConfig({
            networkAddress : 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
        });
        return(EthMainNetwork);
     }

     // for ethereum sepolia
     function EthSepoliaNetworkConfig() public pure returns(networkConfig memory) {
        networkConfig memory EthSepoliaNetwork = networkConfig({
            networkAddress : 0x694AA1769357215DE4FAC081bf1f309aDC325306
        });
        return(EthSepoliaNetwork);
     }

     function AnvilNetworkConfig() public  returns (networkConfig memory) {
         vm.startBroadcast();
         MockV3Aggregator mockV3Aggregator = new MockV3Aggregator(decimals, initialAnswer);
         vm.stopBroadcast();
         networkConfig memory AnViLNetwork = networkConfig({
            networkAddress : address(mockV3Aggregator)
        });
        return(AnViLNetwork);
     }

    // this is a function to return the contract active netwoek address
     function getActiveNetworkAddress() public view returns(networkConfig memory){
        return(activeNetWotkConfig);
     }
}