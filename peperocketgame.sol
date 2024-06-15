// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PepeRocketGame is ERC20, Ownable {
    uint256 public poolPrize;

    constructor() ERC20("PepeRocketGame", "PEPEG") Ownable(msg.sender) {
        uint256 totalSupply = 650000000 * 10 ** decimals();
        _mint(msg.sender, totalSupply); // Mint 650,000,000 tokens to the contract deployer
        poolPrize = 350000000 * 10 ** decimals(); // Set poolPrize to 350,000,000 tokens
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function reward(address to, uint256 amount) external {
        require(amount <= poolPrize, "Reward amount exceeds pool prize");
        poolPrize -= amount;
        _mint(to, amount);
    }
}
