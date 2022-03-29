// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract ERC1155Multiple is ERC1155 {
    uint256 public constant MAIN_CURRENCY = 0;
    uint256 public constant NFT_ITEMS = 1;
    uint256 public constant SECOND_CURRENCY = 2;

    constructor() ERC1155("URI placeholder") {
        _mint(msg.sender, MAIN_CURRENCY, 10000, "");
        _mint(msg.sender, SECOND_CURRENCY, 20000, "");
        _mint(msg.sender, NFT_ITEMS, 1, "");
    }
}
