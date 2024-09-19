# FUNDME CONTRACT

The FundMe contract is a decentralized crowdfunding platform built using Solidity, integrating Chainlink’s price feed oracles to ensure contributions meet a minimum USD value. This contract enables users to contribute Ether (ETH) while verifying that their contribution is worth at least $5 USD using real-time conversion rates. It also provides functionality for the contract owner to withdraw all funds.
<br>
<br>

## Key Feature
* **Chainlink Price Feed Integration:**
     <p>Utilizes Chainlink’s decentralized oracles to fetch live ETH/USD conversion rates, ensuring that each contribution is at least $5 USD.</p>
* **Contribution Tracking:**
     <p>Each contribution is logged, allowing the contract owner to view details of all contributors.</p>
* **Secure Fund Withdrawal:**
      <p>Only the owner can withdraw the accumulated funds, and the withdrawal process ensures all balances are reset.</p>
  <br>
  <br>
  
  
## Contract Details
* **Deployed Address:**
```solidity
   0x1F3e9C6a316A71111949be7E4f892219724e5de2
```
* **Network:** 
     <p>Sepolia Testnet</p>
* **Minimum Contribution:**
    <p>$5 USD (in wei)</p>
* **Chainlink Price Feed:**
    <p>Uses Chainlink oracles to convert ETH to USD.</p>

       
## Libraries and External Integrations
* **Chainlink Price Feed:** 
   <p>The contract integrates Chainlink’s price feed to convert ETH to its USD equivalent.</p>
* **PriceConverter Library:** 
   <p> A custom library that provides conversion functions from ETH to USD using Chainlink’s price feed.
</p>
<br>
<br>
      
## How to Interact with the Contract:
   <p>The contract is deployed on the Sepolia testnet, and you can interact with it using the deployed address above. To fund the contract, each contribution must be at least $5 USD worth of ETH (in wei).</p>
<p>Here are the steps to interact:</p>

1. **Funding the Contract:** (Send at least $5 USD worth of ETH to the contract using the FUND function.)
    <p>This ensures that your contribution meets the minimum requirement, based on live ETH/USD rates provided by Chainlink.</p>

2. **Withdrawing Funds:** (The contract owner can withdraw all funds by calling the Withdraw function.)
   <p>After the withdrawal, all contributor records are reset.</p>
<br>
<br>

## Deployment
* **Sepolia Network:**
   <p>The contract has been deployed on the Sepolia testnet. If you'd like to interact with the contract or test it, use the following deployed contract address:</p>

* **Deployed Contract Address:** 
```bash
 0x1F3e9C6a316A71111949be7E4f892219724e5de2
```
<br>
<br>
  
## Clone and Contribute
    <P>If you'd like to contribute or explore the contract further, follow these steps:</P>
* **Clone the Repository:**
```bash
 git clone https://github.com/Davidexdev2023/FundMe-contract.git
```
<br>
<br>

## Install Dependencies:
  <p>Make sure you have Foundry installed for local testing.</p>
  
* **Install required dependencies:**
```bash
    forge install
```
* **Deploy the Contract:** 
  <p>To deploy the contract on a local network or a testnet, you'll need to specify the Chainlink price feed address for your network.</p>
```bash
 fundMe = new FundMe("0xYourChainlinkPriceFeedAddress");
```

* **Run Tests:**
  <p>The contract includes unit tests to validate its functionality. Run the following command to execute all tests:</p>
``` bash
    forge test
```
