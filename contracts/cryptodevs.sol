// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

import "contracts/whitelist.sol";

contract CryptoDevs is ERC721Enumerable, Ownable {

    uint8 constant public maxTokens = 20;
    uint8 public reservedTokens;
    uint8 public reservedTokensMint = 0;

    whitelist _whitelist;

    uint256 constant public NFTPrice = 0.01 ether;  

    constructor (address whitelistContract) ERC721("Crypto Devs", "CD") {
        _whitelist = whitelist(whitelistContract);
        reservedTokens = _whitelist.maxUsers();
    }

    function mint() public payable {

        //firstly, check if there's still tokens available for the whitelisted users
        //then, check if the user is part of the whitelist
        //If it is so, check if the user already has an NFT, if not, give one to him
        //otherwise, check balance of the user and mint the nft to him

        require(totalSupply() + reservedTokens - reservedTokensMint < maxTokens, "max supply has been reached");

        if (_whitelist._whitelist(msg.sender) == true) {

            require(balanceOf(msg.sender) == 0, "User already has a NFT");
            reservedTokensMint++;

        } else {

            require(msg.value >= NFTPrice, "Eth value is not enough to buy the NFT");

        }

        //the tokenID is the total os tokens stored in the contract. So each time and NFT is minted, this value is incremented
        _safeMint(msg.sender, totalSupply());

    }

    function withdraw() public onlyOwner {
        address _owner = owner();
        uint256 amount = address(this).balance;
        (bool sent, ) = _owner.call{value: amount}("");
        require(sent, "failed to send Ether");

    }

}