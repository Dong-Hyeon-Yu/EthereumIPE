// SPDX-License-Identifier: MIT
pragma solidity <=0.8.15;


contract Fp12Mult {

  event Result(uint256[12] res);

  function mul (bytes memory input) public payable returns (uint256[12] memory) {
    
    bool success;
    uint256[12] memory result;

    assembly {
      success := call(
          not(0), // gas
          0x14,   // callee address
          0,      // 지급할 가스양
          input,  // 파라미터 시작 주소
          768,    // 파라미터 변수 메모리 크기
          result, // 반환값 메모리 주소
          384     // 반환값 메모리 크기
      )
    }

    require(success, "fail to funtion call!");
    emit Result(result);

    return result;
  }

    function multiply (uint256[12] memory a, uint256[12] memory b) public payable returns (uint256[12] memory) {

        bool success;
        uint256[12] memory result;
        //uint256[12][2] memory input = [a, b];
        uint256[24] memory input;
        for (uint256 i = 0; i<12; i++) {
            input[i] = a[i];
            input[i+12] = b[i];
        }

        assembly {
            success := call(
            not(0), // gas
            0x14,   // callee address
            0,      // 지급할 가스양
            input,  // 파라미터 시작 주소
            768,    // 파라미터 변수 메모리 크기
            result, // 반환값 메모리 주소
            384     // 반환값 메모리 크기
            )
        }

        require(success, "fail to funtion call!");
        emit Result(result);

        return result;
    }

}
