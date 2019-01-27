pragma solidity ^0.5.0;

import { Ownable } from "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "openzeppelin-solidity/contracts/lifecycle/Pausable.sol";

contract BountyClaimant is Ownable, Pausable {
    address internal claimant;

    function getClaimant() public view returns(address) {
        return claimant;
    }

    function setClaimant(address newClaimant) external onlyOwner {
        claimant = newClaimant;
    }

    function checkInvariant() public returns(bool) {
        return claimant == address(0);
    }
}