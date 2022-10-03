const bn256fp12MulContract1 = artifacts.require("Fp12Mult");
const bn256fp12MulContract2 = artifacts.require("test_fp12");

module.exports = function(deployer) {
    deployer.deploy(bn256fp12MulContract2);
    deployer.deploy(bn256fp12MulContract1);
}
