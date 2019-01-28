pragma solidity ^0.5.0;

import "openzeppelin-solidity/contracts/math/SafeMath.sol";
import "openzeppelin-solidity/contracts/lifecycle/Pausable.sol";
import "./Bounty.sol";

contract BountyBoard is Pausable, Ownable {
    using SafeMath for uint256;
    event LogBountyCreated(address bountyOwner, Bounty bountyContract);

    mapping(address => Bounty[]) internal ownedBounties;
    Bounty[] internal bounties;

    function createBounty(string memory description) public whenNotPaused returns(Bounty) {
        Bounty newBounty = new Bounty(description);
        ownedBounties[msg.sender].push(newBounty);
        bounties.push(newBounty);
        emit LogBountyCreated(msg.sender, newBounty);
        return newBounty;
    }

    function getOwnedBounties() public view returns(Bounty[] memory) {
        return ownedBounties[msg.sender];
    }

    function getAllBounties() public view returns(Bounty[] memory) {
        return bounties;
    }
}
