contract C {
    function f() internal returns (uint a) {
        assembly {
            a := shr(8, a)
        }
    }
}