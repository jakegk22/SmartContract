var ProofOfExistence1 = artifacts.require("./ProofOfExistence1.sol");
var MyToken1 = artifacts.require("./MyToken1.sol");
module.exports = function(deployer) {
  deployer.deploy(ProofOfExistence1);
  deployer.deploy(MyToken1);
};
