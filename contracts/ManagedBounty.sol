pragma solidity ^0.5.0;

import { Ownable } from "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import { BountyClaimant } from "./BountyClaimant.sol";

contract ManagedBounty is Ownable {
    string internal description;

    constructor (string memory newDescription) public {
        description = newDescription;
    }

    function getDescription() public view returns(string memory) {
        return description;
    }

    function setDescription(string calldata newDescription) external onlyOwner {
        description = newDescription;
    }

    function deployContract() internal onlyOwner returns(BountyClaimant) {
        return new BountyClaimant();
    }
}