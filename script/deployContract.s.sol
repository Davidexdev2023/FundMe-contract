// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./helperConfig.s.sol";

contract DeployFundMe is Script {
    FundMe fundMe;
    HelperConfig helperConfig;
    function run () external returns(FundMe) {
        helperConfig = new HelperConfig();
        address ConfigNetworkAddress =   helperConfig.getActiveNetworkAddress().networkAddress;
        vm.startBroadcast();
        fundMe = new FundMe(ConfigNetworkAddress);
        vm.stopBroadcast();
        return(fundMe);
    }
}