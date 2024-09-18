FundMe Smart Contract
The FundMe contract is a decentralized crowdfunding platform built using Solidity, integrating Chainlink’s price feed oracles to ensure contributions meet a minimum USD value. This contract enables users to contribute Ether (ETH) while verifying that their contribution is worth at least $5 USD using real-time conversion rates. It also provides functionality for the contract owner to withdraw all funds.

Key Features
Chainlink Price Feed Integration: Utilizes Chainlink’s decentralized oracles to fetch live ETH/USD conversion rates, ensuring that each contribution is at least $5 USD.
Contribution Tracking: Each contribution is logged, allowing the contract owner to view details of all contributors.
Secure Fund Withdrawal: Only the owner can withdraw the accumulated funds, and the withdrawal process ensures all balances are reset.
Contract Details
Deployed Address:
'''
 0x1F3e9C6a316A71111949be7E4f892219724e5de2
 '''
Network: Sepolia Testnet
Minimum Contribution: $5 USD (in wei)
Chainlink Price Feed: Uses Chainlink oracles to convert ETH to USD.
Libraries and External Integrations
Chainlink Price Feed: The contract integrates Chainlink’s price feed to convert ETH to its USD equivalent.
PriceConverter Library: A custom library that provides conversion functions from ETH to USD using Chainlink’s price feed.
How to Interact with the Contract
The contract is deployed on the Sepolia testnet, and you can interact with it using the deployed address above. To fund the contract, each contribution must be at least $5 USD worth of ETH (in wei).

Here are the steps to interact:

Funding the Contract:

Send at least $5 USD worth of ETH to the contract using the FUND function.
This ensures that your contribution meets the minimum requirement, based on live ETH/USD rates provided by Chainlink.
Withdrawing Funds:

The contract owner can withdraw all funds by calling the Withdraw function.
After the withdrawal, all contributor records are reset.
Deployment
Sepolia Network
The contract has been deployed on the Sepolia testnet. If you'd like to interact with the contract or test it, use the following deployed contract address:

Deployed Contract Address: 0xYourDeployedContractAddress

Clone and Contribute
If you'd like to contribute or explore the contract further, follow these steps:

Clone the Repository:
'''
    git clone https://github.com/Davidexdev2023/FundMe-contract.git
'''
Install Dependencies: Make sure you have Foundry installed for local testing.

Install required dependencies:
'''
    forge install
'''
Deploy the Contract: 
To deploy the contract on a local network or a testnet, you'll need to specify the Chainlink price feed address for your network.
'''
fundMe = new FundMe("0xYourChainlinkPriceFeedAddress");
'''
Run Tests: The contract includes unit tests to validate its functionality. Run the following command to execute all tests:
''' 
    forge test

'''
