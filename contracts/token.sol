// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract VinceToken is ERC20("Vince Token", "VL"), Ownable {
    function mint() public onlyOwner {
        _mint(msg.sender, 50 * 10**18);
    }
}