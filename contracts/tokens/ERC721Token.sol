// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract ERC721Token is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter public tokenId;

    uint256 public maxTokenSupply;

    constructor(uint256 maxSupply) ERC721("Papu Item", "PAT") {
        maxTokenSupply = maxSupply;
    }

    //Mint token if it is still available by the max supply indicator
    function mintToken(address account) external {
        uint256 currentId = tokenId.current();

        require(
            currentId <= maxTokenSupply,
            "There's no more tokens for you :c"
        );

        _mint(account, currentId);

        tokenId.increment();
    }
}
