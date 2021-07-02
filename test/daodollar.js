const { BN, expectRevert, send, ether } = require('@openzeppelin/test-helpers');
const { web3 } = require('@openzeppelin/test-helpers/src/setup');
const token = artifacts.require("@openzeppelin/contracts/token/ERC20/IERC20.sol");
const daodollar  = artifacts.require ("./daodollar.sol");
const dollaparams  = artifacts.require ("./DollarParams.sol");

contract("daodollar Test", async accounts => {
  var dd;
  var params;

  it('should be able to deploy contracts', async () => {
    dd = await daodollar.new()
    params = await dollaparams.new()
  });

});