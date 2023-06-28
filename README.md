# NFTCollectionWhiteList

## Setup
```bash
npm init --yes
npm install --save-dev hardhat @nomicfoundation/hardhat-toolbox
npx hardhat
npm install dotenv
npm install @openzeppelin/contracts
```
Create a .env file to put the next environment variables
```
PRIVATE_KEY="..."
RPC_URL="..."
ETHERSCAN_API_KEY="..."
```
Make sure the private key is from a testing account and this account has funds on the Sepolia network.
You can get a RPC url through QuickNode, just create an Ethereum endpoint on the Sepolia network.
The same works for the ETHERSCAN.

## Run
To deploy the whitelist contract:
```
npx hardhat run deploy.js --network sepolia
```
This will verify the contract deployed and give you an URL to the ETHERSCAN where is possible to interact with the contract.
Make sure to replace the address received on the crytodevs.sol file


To deploy the CryptoDevs contract:
```
npx hardhat deploy-nft.js --network sepolia
```

## Interact

