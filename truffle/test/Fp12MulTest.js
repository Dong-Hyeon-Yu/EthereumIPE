const BigNumber = web3.utils.BN;
const Fp12MulContract = artifacts.require("Fp12Mult");
const utils = web3.utils

const gfpSize = 32; //32bytes
const terms = 12;
const fp12Size = gfpSize*terms*2; // 32bytes * 12terms * 2hex(1byte==2hex)
const _zero = web3.utils.padLeft('0x00', fp12Size);
const _one = web3.utils.padLeft('0x01', fp12Size);
const _sth = '0x' + '1'.repeat(fp12Size)

contract("Fp12MulTest", function([_, owner, investor]) {

    let contract;

    beforeEach("before each", async() => {
        contract = await Fp12MulContract.deployed();
    });

    describe("[case1] 0을 곱하면 0이다.", () => {
        it("0 x 0 = 0", async () => {

            const decodedResult = await callFp12Mul(contract, _zero, _zero);

            assert.equal(decodedResult, _zero, "0 x 0 의 결과가 0 이 아닙니다!");
        });

        it("0 x 1 = 0", async () => {

            const decodedResult = await callFp12Mul(contract, _zero, _one);

            assert.equal(decodedResult, _zero, "0 x 1 의 결과가 0 이 아닙니다!");
        });

        it("1 x 0 = 0", async () => {

            const decodedResult = await callFp12Mul(contract, _one, _zero);

            assert.equal(decodedResult, _zero, "1 x 0 의 결과가 0 이 아닙니다!");
        });

    });

    describe("[case2] 1은 항등원이다.", () => {

    	it("1 x N = 1", async () => {

            const decodedResult = await callFp12Mul(contract, _one, _sth);

            assert.equal(decodedResult, _sth, "1 x N 의 결과가 N 이 아닙니다!");
        });

        it("1 x 1 = 1", async () => {

            const decodedResult = await callFp12Mul(contract, _one, _one);

            assert.equal(decodedResult, _one, "1 x 1 의 결과가 1 이 아닙니다!");
        });

    });
});


async function callFp12Mul(contract, a, b) {

    const input = make_gfp12(a,b);
    const result = await contract.mul.call(input); 
    return decode(result);
}

function make_gfp12(a, b) {

    var temp = web3.utils.stripHexPrefix(b);
    return web3.utils.hexToBytes(a.concat(temp));
}

function decode(result) {

    var decoded = "";

    for (var val of result) {
        decoded += utils.stripHexPrefix(utils.padLeft(utils.toHex(val), gfpSize*2));
    }

    return "0x" + decoded;
}
