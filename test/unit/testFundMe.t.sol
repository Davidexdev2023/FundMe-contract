// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
import {FundMe} from "../../src/FundMe.sol";
import {Test,console} from "forge-std/Test.sol";
import{DeployFundMe} from "../../script/deployContract.s.sol";


contract TestFundMe is Test {
    FundMe fundMe;
    uint256 versionNumber;
    address USER = makeAddr('user');
    uint256 VALUE = 10e18;
    uint256 SEND_VALUE = 4e18;

    function setUp () external {
       DeployFundMe deployFundMe = new DeployFundMe();
       fundMe = deployFundMe.run();
       console.log(address(fundMe).balance);
      if (address(fundMe).balance > 0){
            vm.prank(msg.sender);
            fundMe.Withdraw();
           // console.log("After the withraw in setUp, balance is", address(fundMe).balance);
        }
       vm.deal(USER,VALUE);
    }

    function testFundMeOwner () public view {
        assertEq(fundMe.getOwner(), msg.sender);
        console.log("Owner's", fundMe.getOwner(), " is same as",  " sender address");
    }

    function testFundFailWithoutValue () public {
        vm.expectRevert();
        fundMe.FUND();
    } 

    function  testFundFailWithValue () public {
        fundMe.FUND{value: 10e18}();
    }

    function testVersion () public {
        versionNumber = 4;
        assertEq(fundMe.Version(), 4);
    }

    function testFunderDetailsCreated() public {
        FundMe.funderStruct memory testFunderDetails;
        vm.prank(USER);
        fundMe.FUND{value: SEND_VALUE}();
        testFunderDetails = fundMe.getFunderDetails();
        assertEq(testFunderDetails.funder, USER);
        assertEq(testFunderDetails.amountSent, SEND_VALUE);
    } 

    function testFunderArrayLength() public {
        fundMe.FUND{value: SEND_VALUE}();
        fundMe.FUND{value: SEND_VALUE}();
        fundMe.FUND{value: SEND_VALUE}();
        assertEq(fundMe.getFundersArrayLength(),3);
    }

    function testWithdrawByRandomUser() public {
        fundMe.FUND{value: SEND_VALUE}();
        fundMe.FUND{value: SEND_VALUE}();
        fundMe.FUND{value: SEND_VALUE}();

        vm.expectRevert();
        fundMe.Withdraw();
    }

    function testWithdrawByOwner() public{

        console.log(address(fundMe).balance);

        vm.expectRevert();
        vm.prank(msg.sender);
        fundMe.Withdraw();

        uint256 userStartingBalance = VALUE;
        uint256 ownerStartingBalance = address(msg.sender).balance;
        

        //funding the contract by prank user
        vm.prank(USER);
        fundMe.FUND{value: SEND_VALUE}();


         vm.prank(msg.sender);
         fundMe.Withdraw();

         uint256 userEndingBalance = address(USER).balance;
         uint256 ownerEndingBalance = address(msg.sender).balance;
        
        
         assertEq(address(fundMe).balance, 0);
         assertEq(userEndingBalance, userStartingBalance-SEND_VALUE);
         assertEq(ownerEndingBalance, ownerStartingBalance+SEND_VALUE);
    }

    function testWithdrawFromMultipleFunders () public {
        //funding by user first User
        vm.prank(USER);
        fundMe.FUND{value: SEND_VALUE}();

        //funding by Various accounts
        uint160 amountOfSenders = 10;
        uint160 funderIndex = 1;

        for(uint160 i = funderIndex; i < amountOfSenders; i++){
            hoax(address(i), VALUE);
            fundMe.FUND{value : SEND_VALUE}();
        }

        assert(address(fundMe).balance > 0);

        vm.prank(msg.sender);
        fundMe.Withdraw();
        assertEq(address(fundMe).balance, 0);

    }
    
    function testContractBalance() public view{
        console.log(address(fundMe).balance);
    }
}