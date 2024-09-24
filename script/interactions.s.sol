// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

//imports
import {FundMe} from "../src/FundMe.sol";
import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";

contract FundFundMe is Script {
    
    function run () external {
        address mostRecentDeployed =  DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );
        fundFundMe(mostRecentDeployed);
    }

    function fundFundMe (address mostDeployedAddress) public {
        uint256 SEND_VALUE =5e18;
        vm.startBroadcast();
        FundMe(payable(mostDeployedAddress)).FUND{value: SEND_VALUE}();
        vm.stopBroadcast(); 
    }
}


contract WithdrawFundMe is Script {
     function run () external view {
        address mostRecentDeployed =  DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );
        WithdrawFundMe(mostRecentDeployed);
    }

    function withdrawFundMe (address fundMeAddress) public  {
        vm.startBroadcast();
        FundMe(payable(fundMeAddress)).Withdraw();
        vm.stopBroadcast();
    }

}