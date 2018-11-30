var WCCToken = artifacts.require("./WCCToken.sol");
var WCCTokenSale = artifacts.require("./WCCTokenSale.sol");

module.exports = function(deployer) {
  deployer.deploy(WCCToken, 1000000).then(function() {
  	var tokenPrice = 1000000000000000;
  	return deployer.deploy(WCCTokenSale, WCCToken.address, tokenPrice);
  });
};
