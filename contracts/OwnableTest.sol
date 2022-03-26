//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract OwnableTest is Ownable {
    function accesableForAnyone() public view {
        console.log("Hey dude");
    }

    function accesableForOwner() public view onlyOwner returns (string memory) {
        console.log("Hey owner!");

        return "Hey";
    }
}
