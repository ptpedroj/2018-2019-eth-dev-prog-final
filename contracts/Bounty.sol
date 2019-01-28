pragma solidity ^0.5.0;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "openzeppelin-solidity/contracts/lifecycle/Pausable.sol";
import "openzeppelin-solidity/contracts/payment/PullPayment.sol";
import "openzeppelin-solidity/contracts/math/SafeMath.sol";
import "./BountySubmission.sol";

contract Bounty is Ownable, Pausable, PullPayment {
    using SafeMath for uint256;
    string internal description;
    mapping(address => BountySubmission) internal ownersSubmissionsMap;
    address[] internal submissionOwners;

    event LogSubmissionCreated(address owner, BountySubmission submission);
    event LogSubmissionApproved(address owner, BountySubmission submission);
    event LogSubmissionRejected(address owner, BountySubmission submission);

    constructor (string memory newDescription) payable public {
        description = newDescription;
    }

    function getDescription() public view returns(string memory) {
        return description;
    }

    function setDescription(string memory newDescription) public onlyOwner {
        description = newDescription;
    }

    function createSubmission(string memory submission) public whenNotPaused returns(BountySubmission) {
        BountySubmission newSubmission = new BountySubmission(submission);
        ownersSubmissionsMap[msg.sender] = newSubmission;
        submissionOwners.push(msg.sender);
        emit LogSubmissionCreated(msg.sender, newSubmission);
        return newSubmission;
    }

    function getOwners() public view returns (address[] memory) {
        return submissionOwners;
    }

    function getSubmissionForOwner(address owner) public view returns (BountySubmission) {
        return ownersSubmissionsMap[owner];
    }

    function approveSubmission(address approvedOwner) public whenNotPaused onlyOwner {
        pause();
        BountySubmission approvedSubmission = ownersSubmissionsMap[approvedOwner];
        for (uint256 i = 0; i < submissionOwners.length; i++) {
            if (approvedOwner != submissionOwners[i]) {
                delete(ownersSubmissionsMap[submissionOwners[i]]);
            }
        }
        submissionOwners = new address[](0);
        submissionOwners.push(approvedOwner);
        emit LogSubmissionApproved(approvedOwner, approvedSubmission);
    }

    function rejectSubmission(address rejectedOwner) public whenNotPaused onlyOwner {
        BountySubmission rejectedSubmission = ownersSubmissionsMap[rejectedOwner];
        delete(ownersSubmissionsMap[rejectedOwner]);
        uint256 rejectedIndex = indexOfOwner(rejectedOwner);
        submissionOwners[rejectedIndex] = submissionOwners[submissionOwners.length - 1];
        submissionOwners.length--;
        emit LogSubmissionRejected(rejectedOwner, rejectedSubmission);
    }

    function indexOfOwner(address subOwner) private view returns (uint256) {
        uint256 index = 0;
        for (; index < submissionOwners.length; index++) {
            if (subOwner == submissionOwners[index]) {
                break;
            }
        }
        return index;
    }
}