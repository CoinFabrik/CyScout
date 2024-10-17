// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Bug {
    uint now; // Overshadows current time stamp.
    uint msg;
    uint tx;

    function assert() public {}

    function block() public {}

    function blockhash() public {}

    function sha256() public {}

    function suicide() public {}

    function keccak256() public {}

    function require() public {}

    function selfdestruct() public {}

    function get_next_expiration(uint earlier_time) private returns (uint) {
        return now + 259200;
    }
}