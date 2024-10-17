// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract IncorrectExponentiation {
    uint UINT_MAX = 2^256 - 1;
}

contract CorrectExponentiation {
    uint UINT_MAX = 2**256 - 1;
}