pragma solidity ^0.5.0;

import "openzeppelin-solidity/contracts/math/SafeMath.sol";
import "openzeppelin-solidity/contracts/lifecycle/Pausable.sol";
import { ManagedBounty } from "./ManagedBounty.sol";

contract BountyBoard is Pausable {
    using SafeMath for uint256;
    event LogBountyCreated(address owner, ManagedBounty bountyContract);

    mapping(address => ManagedBounty[]) internal bountyBuckets;

    function createBounty(string memory description) public returns(ManagedBounty) {
        bountyBuckets[msg.sender].push(new ManagedBounty(description));
        uint256 lastBountyIndex = bountyBuckets[msg.sender].length - 1;
        emit LogBountyCreated(msg.sender, bountyBuckets[msg.sender][lastBountyIndex]);
        return bountyBuckets[msg.sender][lastBountyIndex];
    }

    function getBounties() public view returns(ManagedBounty[] memory) {
        return bountyBuckets[msg.sender];
    }
}