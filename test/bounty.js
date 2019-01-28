var Bounty = artifacts.require("./Bounty.sol");

contract("Bounty", (accounts) => {
  const bountyDescription = "Prove this test works.";
  let bounty;

  beforeEach(async () => {
    bounty = await Bounty.new(bountyDescription);
  });

  // For completeness, let's make sure the contract deploys ok.
  // A contract has an address member that can be turned into a 
  // number that can be tested to be greater than zero.
  it("can create bounty", async () => {
    assert.isTrue(Number(bounty.address) > 0);
  });
});