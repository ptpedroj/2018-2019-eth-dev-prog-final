var BountyBoard = artifacts.require("./BountyBoard.sol");

contract("BountyBoard", (accounts) => {
  const bountyDescription = "Prove this test works.";
  let board;

  beforeEach(async () => {
    board = await BountyBoard.new();
  });

  // For completeness, let's make sure the contract deploys ok.
  // A contract has an address member that can be turned into a 
  // number that can be tested to be greater than zero.
  it("can create bounty board", async () => {
    assert.isTrue(Number(board.address) > 0);
  });

  // Check that a bounty can be created, by creating a bounty
  // and see if the bounty list contains that single member that is 
  // non-zero address. This also confirms that one bounty can be
  // returned by getAllBounties.
  it("can create bounty", async () => {
    await board.createBounty(bountyDescription);
    const bounties = await board.getAllBounties.call();
    assert.isTrue(bounties.length === 1, "");
    assert.isTrue(Number(bounties[0]) > 0);
  });

  // Confirm that the contract initially has no bounties listed.
  it("can get list of no bounties", async () => {
    const bounties = await board.getAllBounties();
    assert.equal(bounties.length, 0, "the bounties array is not empty");
  });


  // Confirm that multiple bounties can be returned for an owner
  it("can get list of bounties for one owner", async () => {  
    const bountyCount = 10;
    for (var i = 0; i < bountyCount; i++) {
        await board.createBounty(bountyDescription);
    }
    const bounties = await board.getOwnedBounties.call();
    assert.equal(bounties.length, bountyCount, "the bounty list length is not equal to " + bountyCount);
  });


  // Confirm that all bounties can be returned for multiple owners
  it("can get list of all bounties from all owners", async () => {  
      const bountyCountPerOwner = 2;
      for (var ownerIndex = 0; ownerIndex < accounts.length; ownerIndex++) {
      for (var b = 0; b < bountyCountPerOwner; b++) {
        await board.createBounty(bountyDescription, { from: accounts[ownerIndex] });
      }
    }
    const bounties = await board.getAllBounties.call();
    assert.equal(bounties.length, bountyCountPerOwner * accounts.length, 
      "the bounty list length is not equal to " + bountyCountPerOwner);
  });
});