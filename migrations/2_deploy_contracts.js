const BountyBoard = artifacts.require("BountyBoard");

module.exports = (deployer) => {
    deployer.deploy(BountyBoard);
}