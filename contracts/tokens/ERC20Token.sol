// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/introspection/ERC165.sol";

contract ERC20Token is ERC20, ERC165 {
    constructor(uint256 initialSupply) ERC20("Papu Token", "PAP") {
        _mint(msg.sender, initialSupply);
    }

    function supportsInterface(bytes4 interfaceId) public view override returns(bool){
        return interfaceId == type(IERC20).interfaceId || super.supportsInterface(interfaceId);
    } 
}
