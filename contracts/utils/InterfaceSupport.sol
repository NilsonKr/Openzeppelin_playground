// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/utils/introspection/IERC165.sol";
import "@openzeppelin/contracts/utils/introspection/ERC165Checker.sol";

contract InterfaceSupportChecker {
  using ERC165Checker for address;

  function checkERC20Support (address contractAdd) external view returns(bool){
    bytes4 interfaceId = type(IERC20).interfaceId;

    return contractAdd.supportsInterface(interfaceId);
  }

  function checkERC721Support (address contractAdd) external view returns(bool){
    bytes4 interfaceId = type(IERC721).interfaceId;

    return contractAdd.supportsInterface(interfaceId);
  }

  function checkERC165Support (address contractAdd) external view returns(bool){
    bytes4 interfaceId = type(IERC165).interfaceId;

    return contractAdd.supportsInterface(interfaceId);
  }

}
