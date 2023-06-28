// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


contract whitelist {

    uint8 public maxUsers;
    uint8 public currentUsers;
    
    mapping (address => bool) public _whitelist;

    constructor(uint8 _maxUsers) {
        maxUsers = _maxUsers;
    }

    function add(address user) public {

        require(!_whitelist[msg.sender], "Sender has already been whitelisted");

        require(currentUsers < maxUsers, "No more users can be whitelisted"); 

        _whitelist[user] = true;
        currentUsers++;
        
    }

    function remove(address user) public {
    

        if (_whitelist[user] = true)
            currentUsers--;
    
        delete _whitelist[user];
    
    }

    //add
    //remove
    //checkIfin

}