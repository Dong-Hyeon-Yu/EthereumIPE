const Fp12MulContract = artifacts.require("test_fp12");

contract("test_fp12", function([_, owner, investor]) {

    let contract;

    beforeEach("before each", async() => {
        contract = await Fp12MulContract.deployed();
    });

    describe("[case1] e(a*g1, g2) * e(b*g1, g2) = e((a+b)g1, g2)", () => {

        it("(a, b) == (1, 1)", async () => {

            await contract.fp12Mul_test(1, 1);
        });

        it("(a, b) == (2, 3)", async () => {

            await contract.fp12Mul_test(2, 3);
        });

    });

});
