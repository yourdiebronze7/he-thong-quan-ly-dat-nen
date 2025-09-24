// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LandRegistry {
    struct Land {
        uint id;
        address owner;
        string details;
        uint256 price;
    }

    mapping(uint => Land) public lands;
    uint public landCount;

    function registerLand(string memory details, uint256 price) public {
        landCount++;
        lands[landCount] = Land(landCount, msg.sender, details, price);
    }

    function transferOwnership(uint id, address newOwner) public {
        require(msg.sender == lands[id].owner, 'Only the owner can transfer ownership.');
        lands[id].owner = newOwner;
    }
}