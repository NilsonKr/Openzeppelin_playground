//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract AccessControlTest is AccessControl {
    bytes32 public constant ROL_OWNER = keccak256("OWNER");
    bytes32 public constant ROL_USER = keccak256("COMMON_USER");

    mapping(string => bytes32) public rolesDicc;

    constructor() {
        rolesDicc["owner"] = ROL_OWNER;
        rolesDicc["user"] = ROL_USER;

        _grantRole(ROL_OWNER, msg.sender);
    }

    function accessAsOwner() external view returns (string memory) {
        require(hasRole(ROL_OWNER, msg.sender), "Only accessable by an owner");

        return "You are a owner";
    }

    function accessAsCommonUser() external view returns (string memory) {
        require(hasRole(ROL_USER, msg.sender), "Only accessable by an user");

        return "You are a common user";
    }

    function grantRoleTo(address account, string memory role)
        external
        onlyRole(ROL_OWNER)
    {
        _grantRole(rolesDicc[role], account);
    }

    function renounceToRole(string memory role) external onlyRole(ROL_OWNER) {
        renounceRole(rolesDicc[role], msg.sender);
    }
}
