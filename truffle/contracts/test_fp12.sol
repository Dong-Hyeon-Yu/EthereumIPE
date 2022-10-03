// SPDX-License-Identifier: MIT
// solium-disable security/no-assign-params

pragma solidity < 0.9.0;

contract test_fp12{
    uint public constant p = 21888242871839275222246405745257275088696311157297823662689037894645226208583;
    uint256[2] gen1 = [
                uint256(1), uint256(2)
        ];
    uint256[2][2] gen2 = [
            [   11559732032986387107991004021392285783925812861821192530917403151452391805634,
                10857046999023057135944570762232829481370756359578518086990519993285655852781   ], 
            [   4082367875863433681332203403145435568316851327593401208105741076214120093531,
                8495653923123431417604973247489272438418190587263600148770280649306958101930]
        ];
    
    function isOnCurve(uint256[2] memory point) internal pure returns (bool) {
        uint256 x = point[0];
        uint256 y = point[1];

        uint256 x3 = mulmod(mulmod(x, x, p), x, p);
        uint256 y2 = mulmod(y, y, p);
    
        return y2 == addmod(x3, 3, p);
    }

    function isInfinity(uint256[2] memory input) internal pure returns (bool) {
        if (input[0] == 0 && input[1] == 0) return true;
        else return false;
    }

    function g1Mul(uint256[2] memory a, uint256 k) internal returns (uint256[2] memory) {
        bool success;
        uint256[3] memory input = [a[0], a[1], k];
        uint256[2] memory result;

        if (isInfinity(a)) return a;
        require(isOnCurve(a), "point is not on curve");
    
        assembly {
        // 0x07     id of the bn256ScalarMul precompile
        // 0        number of ether to transfer
        // 96       size of call parameters, i.e. 96 bytes total (256 bit for x, 256 bit for y, 256 bit for scalar)
        // 64       size of call return value, i.e. 64 bytes / 512 bit for a BN256 curve point
        success := call(not(0), 0x07, 0, input, 96, result, 64)
        }
        require(success, "elliptic curve multiplication failed");
        return result;
    }

    function pairingEval (uint256[2] memory g1, uint256[2][2] memory g2) public payable returns(uint256[12] memory) {
        uint256[] memory input = new uint256[](6);
        input[0] = g1[0];       input[1] = g1[1];
        input[2] = g2[0][0];    input[3] = g2[0][1];
        input[4] = g2[1][0];    input[5] = g2[1][1];

        uint256[12] memory output;
        bool success;
        assembly {
            success := call(not(0), 0x13, 0, add(input, 0x20), mul(6, 0x20), output, mul(12, 0x20))
        }
        require(success, "pairing evaluation fail");
        return output;
    }

    function fp12Mul(uint256[12] memory a, uint256[12] memory b) public payable 
    returns (uint256[12] memory) {
        uint256[24] memory input;
        for (uint256 i = 0; i < 12; i++) {
            input[i] = a[i];
            input[i+12] = b[i];
        }
        uint256 len = 24 * 32;

        bool success = false;
        uint256[12] memory output;

        assembly {
            success := call(not(0), 0x14, 0, input, len, output, mul(12, 0x20))
        }
        require(success, "fp12mul precompile contract call fail");

        return output;
    }

    function fp12Mul_test(uint256 k1, uint256 k2) public payable 
    returns (uint256[12] memory){
        uint256[2] memory a = g1Mul(gen1, k1);
        uint256[2] memory b = g1Mul(gen1, k2);

        uint256[2] memory aPlusb = g1Mul(gen1, k1 + k2);

        /* e( k1 * g1 , g2 ) * e( k2 * g1, g2 ) = e( (k1 + k2) * g1, g2 ) */
        uint256[12] memory e1 = pairingEval(a, gen2);
        uint256[12] memory e2 = pairingEval(b, gen2);
        uint256[12] memory e3 = pairingEval(aPlusb, gen2);

        uint256[12] memory output = fp12Mul(e1, e2);
        for(uint256 i = 0; i < 12; i++)
            require(output[i] == e3[i], "wrong fp12 mul");

        return output;
    }
}