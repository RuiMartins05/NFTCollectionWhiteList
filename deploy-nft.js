const hre = require("hardhat");

async function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

async function main() {

  const cryptoDevsContract = await hre.ethers.deployContract("CryptoDevs", ["0xa238DEC4Bd889d4972972bc09e17346770780706"]);

  await cryptoDevsContract.waitForDeployment();

  console.log("Whitelist Contract Address:", cryptoDevsContract.target);


  await sleep(30 * 1000); 
  
  await hre.run("verify:verify", {
    address: cryptoDevsContract.target,
    constructorArguments: ["0xa238DEC4Bd889d4972972bc09e17346770780706"],
  });
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });