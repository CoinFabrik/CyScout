# Divide before multiply

## Description

Based on Slither's [divide-before-multiply detector](https://github.com/crytic/slither/wiki/Detector-Documentation#divide-before-multiply).


Solidity's integer division truncates. Thus, performing division before multiplication can lead to precision loss.

## Exploit Scenario:

```
contract A {
	function f(uint n) public {
        coins = (oldSupply / n) * interest;
    }
}
```

If n is greater than oldSupply, coins will be zero. For example, with `oldSupply = 5; n = 10, interest = 2`, coins will be zero.
If `(oldSupply * interest / n)` was used, coins would have been 1.
In general, it's usually a good idea to re-arrange arithmetic to perform multiplication before division, unless the limit of a smaller type makes this dangerous.

## Recommendation

Consider ordering multiplication before division.