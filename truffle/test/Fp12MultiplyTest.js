const BigNumber = web3.utils.BN;
const Fp12MulContract = artifacts.require("Fp12Mult");
const utils = web3.utils

const gfpSize = 32; //32bytes
const terms = 12;
const fp12Size = gfpSize*terms*2; // 32bytes * 12terms * 2hex(1byte==2hex)
const _zero = Array.from({length:12}, ()=>BigNumber(0));
const _one = Array.from({length:12}, (v, i) => (i == 11 ? BigNumber(1) : BigNumber(0)))
const _decodedZero = decode(_zero);
const _decodedOne = decode(_one);

contract("Fp12Multiplication", function([_, owner, investor]) {

    let contract;

    beforeEach("before each", async() => {
        contract = await Fp12MulContract.deployed();
    });

    describe("[case1] 0을 곱하면 0이다.", () => {
        it("0 x 0 = 0", async () => {

            const decodedResult = await callFp12Mul(contract, _zero, _zero);

            assert.equal(decodedResult, _decodedZero, "0 x 0 의 결과가 0 이 아닙니다!");
        });

        it("0 x 1 = 0", async () => {

            const decodedResult = await callFp12Mul(contract, _zero, _one);

            assert.equal(decodedResult, _decodedZero, "0 x 1 의 결과가 0 이 아닙니다!");
        });

        it("1 x 0 = 0", async () => {

            const decodedResult = await callFp12Mul(contract, _one, _zero);

            assert.equal(decodedResult, _decodedZero, "1 x 0 의 결과가 0 이 아닙니다!");
        });

    });

    describe("[case2] 1은 항등원이다.", () => {

        it("1 x 1 = 1", async () => {

            const decodedResult = await callFp12Mul(contract, _one, _one);

            assert.equal(decodedResult, _decodedOne, "1 x 1 의 결과가 1 이 아닙니다!");
        });

    	it("1 x N = 1", async () => {

            const _sth = Array.from({length:12}, ()=>BigNumber(0xFFFF));
            const decodedResult = await callFp12Mul(contract, _one, _sth);
            //console.log(_sth);
            //console.log(decodedResult);
            //console.log(decode(_sth));
            assert.equal(decodedResult, decode(_sth), "1 x N 의 결과가 N 이 아닙니다!");
        });


    });
});


async function callFp12Mul(contract, a, b) {

    let result = await contract.multiply.call(a, b); 
    //console.log((await contract.multiply(a, b)).logs[0].args.res);
    return decode(result);
}

function decode(result) {

    var decoded = "";

    for (var val of result) {
        decoded += utils.stripHexPrefix(utils.padLeft(utils.toHex(val), gfpSize*2));
    }

    return "0x" + decoded;
}
