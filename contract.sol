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

    event LandRegistered(uint indexed id, address indexed owner, string details, uint256 price);
    event OwnershipTransferred(uint indexed id, address indexed previousOwner, address indexed newOwner);

    function registerLand(string memory details, uint256 price) public {
        landCount++;
        lands[landCount] = Land(landCount, msg.sender, details, price);
        emit LandRegistered(landCount, msg.sender, details, price);
    }

    function transferOwnership(uint id, address newOwner) public {
        require(msg.sender == lands[id].owner, 'Only the owner can transfer ownership.');
        address previousOwner = lands[id].owner;
        lands[id].owner = newOwner;
        emit OwnershipTransferred(id, previousOwner, newOwner);
    }
}