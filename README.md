# NFTCollectionWhiteList

## Project Explained
This project consists of creating a limited NFT Collection (20 tokens max) which the first 10 people will get the NFT for free. These people are on the whitelist. After the whitelist is full, each person needs to pay 0.01 ethers for the NFT. 
This project must always use the testnet Sepolia network with fake funds. To get these: https://sepoliafaucet.com/

## Setup
```bash
npm install
```

Create a .env file to put the next environment variables
```
PRIVATE_KEY="..."
RPC_URL="..."
ETHERSCAN_API_KEY="..."
```
Make sure the private key is from a testing account and this account has funds on the Sepolia network (https://sepoliafaucet.com/).
You can get an RPC url through QuickNode (https://www.quicknode.com/), just create an Ethereum endpoint on the Sepolia network.
The same works for the ETHERSCAN (https://etherscan.io/).

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
Open the two URL's given when deploying the contracts, click on "Read Contract" to read the state of the contract and
click on "Write Contract" to modify it, but first, a wallet like MetaMask must be connected.

### Example
- Add an address to the whitelist (on the whitelist contract) and try to mint an NFT (on the cryptodevs contract) with that address while paying 0 ethers. It must be successfull.

- Then try to connect another account (Not added to the whitelist) and try to mint a NFT with 0.01 ethers. As long as you have funds on you account, it must work.
