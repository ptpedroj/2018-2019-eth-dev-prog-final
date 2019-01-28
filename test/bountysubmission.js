var BountySubmission = artifacts.require("./BountySubmission.sol");

contract("BountySubmission", (accounts) => {
  const submissionText = "Super awesome submission right here";
  let submission;

  beforeEach(async () => {
    submission = await BountySubmission.new(submissionText);
  });

  // For completeness, let's make sure the contract deploys ok.
  // A contract has an address member that can be turned into a 
  // number that can be tested to be greater than zero.
  it("can create bounty", async () => {
    assert.isTrue(Number(submission.address) > 0);
  });


  // Get the submission text.
  it("can get bounty description", async () => {
    var text = await submission.getSubmission.call();
    assert.equal(text, submissionText, "the submissions do not match");
  });
});