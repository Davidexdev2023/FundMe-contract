// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import {PriceConverter} from "./library.sol";


contract FundMe {
    using PriceConverter for uint256;

    address private S_owner ;
    uint256 constant private MINIMUM_USD = 59e7;

    AggregatorV3Interface immutable private dataFeed;
     constructor(address NetworkAddress){
         dataFeed = AggregatorV3Interface(NetworkAddress);
         S_owner = msg.sender;
    }

    struct funderStruct {
        address funder;
        uint256 amountSent;
    }
    
    funderStruct private funderDetails;
    funderStruct[] private fundersArray;


    //fund Function
    function FUND () public payable {
        require(msg.value.getconversion(dataFeed) > MINIMUM_USD);
        funderDetails = funderStruct({
            funder : msg.sender,
            amountSent : msg.value
        });
        fundersArray.push(funderDetails);
    } 

    function Withdraw () public {
        require(address(this).balance > 0);
        uint256 FundersArrayLength = getFundersArrayLength();
        for(uint256 funderIndex = 0; funderIndex < FundersArrayLength;  funderIndex++){
             fundersArray[funderIndex].amountSent = 0;
       }
        delete fundersArray;
        (bool callSuccess, ) =payable (msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "call failed");
    }


    //Setting out modifier
    modifier onlyOwner () {
        require(msg.sender == S_owner, 'cannot access');
        _;
    }



    //GETTER FUNCTIONS!!!
    function Version () public view returns (uint256){
        uint256 version = dataFeed.version();
        return (version
        );
    }
    function getOwner() public view returns(address){
        return(S_owner);
    }

    function getFundersArrayLength() public view returns(uint256){
        return(fundersArray.length);
    }

    function getMINIMUM_USD () public pure returns (uint256){
        return(MINIMUM_USD);
    }  

    function getFunderDetails () public view returns (funderStruct memory){
        return(funderDetails);
    }
    function getFundersArray () public view returns (funderStruct[] memory){
        return(fundersArray);
    }
}