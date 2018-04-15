var FoobsToken = artifacts.require("../contracts/FoobsToken.sol");
module.exports = function(deployer) {
  deployer.deploy(FoobsToken);
};