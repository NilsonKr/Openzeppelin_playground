// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 */
contract AccesControlChallenge is AccessControl {
    uint256 private number;

    bytes32 public constant ROL_ADMIN = keccak256("ADMIN");
    bytes32 public constant ROL_WRITER = keccak256("WRITER");

    constructor() {
        _grantRole(ROL_ADMIN, msg.sender);
        _grantRole(ROL_WRITER, msg.sender);
    }

    /**
     * @dev Store value in variable
     * @param num value to store
     */
    function store(uint256 num) public onlyRole(ROL_WRITER) {
        number = num;
    }

    /**
     * @dev Return value
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256) {
        return number;
    }

    function assignWriter(address account) external onlyRole(ROL_ADMIN) {
        _grantRole(ROL_WRITER, account);
    }

    function removeWrite(address account) external onlyRole(ROL_ADMIN) {
        _revokeRole(ROL_WRITER, account);
    }
}
