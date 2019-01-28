pragma solidity ^0.5.0;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "openzeppelin-solidity/contracts/lifecycle/Pausable.sol";

contract BountySubmission is Ownable, Pausable  {
    string internal submission;

    event LogSubmissionSet(string newSubmission);

    constructor(string memory newSubmission) public {
        submission = newSubmission;
    }

    function setSubmission(string memory newSubmission) public whenNotPaused onlyOwner {
        submission = newSubmission;
        emit LogSubmissionSet(newSubmission);
    }

    function getSubmission() public view returns (string memory) {
        return submission;
    }
}