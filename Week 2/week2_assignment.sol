// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeadmansSwitch {
    address public owner;          // The owner of the contract
    address public beneficiary;    // The address to receive funds if the owner is inactive
    uint256 public lastActiveBlock; // Block number when the owner was last active

    constructor(address _beneficiary) {
        owner = msg.sender;
        beneficiary = _beneficiary;
        lastActiveBlock = block.number;
    }

    // Modifier to ensure that only the owner can call certain functions
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    // Function to record activity and reset the timer
    function still_alive() public onlyOwner {
        lastActiveBlock = block.number;
    }

    // Function to check if the owner is still active and transfer funds if not
    function checkAndTransfer() external {
    require(block.number - lastActiveBlock > 10, "Owner is still active");
    payable(beneficiary).transfer(address(this).balance);
    }
    receive() external payable {}
}
