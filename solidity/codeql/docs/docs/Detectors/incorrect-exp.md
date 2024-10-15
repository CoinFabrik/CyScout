# Incorrect exponentiation

## Description

Based on Slither's [incorrect-exp detector](https://github.com/crytic/slither/wiki/Detector-Documentation#incorrect-exponentiation).

Detect use of bitwise xor `^` instead of exponential `**`.

## Exploit Scenario:

```
contract Bug{
    uint UINT_MAX = 2^256 - 1;
    ...
}
```

Alice deploys a contract in which `UINT_MAX` incorrectly uses `^` operator instead of `**` for exponentiation

## Recommendation

Use the correct operator `**` for exponentiation.