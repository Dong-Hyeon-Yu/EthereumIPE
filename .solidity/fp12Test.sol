// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract TestContract {

  event Debug(string message);

  function test (uint256[24] calldata input) public returns (uint256[12] memory c) {

    emit Debug("test bn256Fp12Mul()");
    assembly {
      let x := mload(0x40)
      mstore(x, input)
      let success := call(5000, // gas 제공량
                          0x14, // contract address
                          0x00, // value
                          x,    // input start address
                          0x300, // input length
                          x,    // output start address
                          0x180) // output length
      c := mload(x)
      mstore(0x40,add(x,0x44)) // Set storage pointer to empty space
    }

  }
}