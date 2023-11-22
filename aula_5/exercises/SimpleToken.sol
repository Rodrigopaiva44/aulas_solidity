// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BasicTokenContract {
    address public owner;
    mapping(address => uint256) public balances;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function mintTokens(uint256 amount) external onlyOwner {
        require(amount > 0, "Amount must be greater than 0");
        balances[owner] += amount;
    }

    function transferTokens(address to, uint256 amount) external {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        require(to != address(0), "Invalid recipient address");

        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    function checkBalance(address account) external view returns (uint256) {
        return balances[account];
    }
}
