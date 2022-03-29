// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract Extensions is
    ERC20("NKT", "NilsonKr Token"),
    Ownable,
    ERC20Burnable,
    Pausable
{
    constructor(uint256 initialSupply) {
        _mint(msg.sender, initialSupply);
    }

    //Only owner will able to burn currencies
    function burn(uint256 amount) public override onlyOwner {
        super._burn(_msgSender(), amount);
    }

    function burnFrom(address account, uint256 amount)
        public
        override
        onlyOwner
    {
        super._spendAllowance(account, _msgSender(), amount);
        super._burn(account, amount);
    }

    //Only owner will able to pause currencies

    function pauseCurrency() public onlyOwner {
        _pause();
    }

    function unpauseCurrency() public onlyOwner {
        _unpause();
    }

    //Controlled by paused flag
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal override whenNotPaused {
        super._beforeTokenTransfer(from, to, amount);
    }
}
