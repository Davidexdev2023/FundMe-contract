// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

//imports
import {Test, console} from "forge-std/Test.sol";
import {DeployFundMe} from "../../script/deployContract.s.sol";
import {FundMe} from "../../src/FundMe.sol";
import {FundFundMe, WithdrawFundMe} from "../../script/interactions.s.sol";


contract TestFunndMeInteractions is Test {
    //declearing state variables
    DeployFundMe deployFundMe;
    FundMe fundMe;
    address USER = makeAddr("user");
    uint256 SEND_VALUE = 2e18;

    function setUp () external {
        deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
        if(address(fundMe).balance > 0){
            vm.prank(fundMe.getOwner());
            fundMe.Withdraw();
        }
        vm.deal(USER, 10e18);
    }


    function testFundMeCanFund () public {
        FundFundMe fundFundMe = new FundFundMe();
        console.log("fundMe current balance is ", address(fundMe).balance);
        fundFundMe.fundFundMe(address(fundMe));
        console.log("fundMe current balance is ", address(fundMe).balance);
        assert(address(fundMe).balance > 0);
    }

    function testFundMeCanWithdraw () public {
        // funding fundME so balance is not zero 
        vm.prank(USER);
        fundMe.FUND{value: SEND_VALUE}();
        console.log("This is fundMe initial", address(fundMe).balance);

        //testing fo see if funds can be withdrawn
        WithdrawFundMe withdrawFundMe = new WithdrawFundMe();
        
        withdrawFundMe.withdrawFundMe(address(fundMe));
        console.log("This is fundMe balance", address(fundMe).balance);
    }

}