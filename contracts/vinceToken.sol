// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

// ERC2 base template
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
// Ownable base template
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract VinceToken is ERC20("Vince Token", "VL"), Ownable {
    // Define the mapping structure for whitelist
    mapping(address => bool) public whitelistedAddresses;

    function addToWhitelist(address _addressToWhitelist) public {
        whitelistedAddresses[_addressToWhitelist] = true;
    }

    // Only owner can remove addresses from whitelist
    function removeFromWhitelist(address _addressToRemove) public onlyOwner {
        whitelistedAddresses[_addressToRemove] = false;
    }

    function verifyWhitelist(address _addressToVerify) public view returns(bool) {
        bool userIsWhitelisted = whitelistedAddresses[_addressToVerify];
        return userIsWhitelisted;
    }

    modifier isWhitelisted(address _addressToCheck) {
        require(verifyWhitelist(_addressToCheck), 'You need to be whitelisted!');
        _;
    }

    function mint() public isWhitelisted(msg.sender) {
        // Mint 50 tokens for the sender
        // 10**18 -> 18 decimals
        _mint(msg.sender, 50 * 10**18);
    }
}