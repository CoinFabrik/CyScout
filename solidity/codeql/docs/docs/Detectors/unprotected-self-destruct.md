# Unrpotected self destruct

## Description

Based on Slither's [suicidal detector](https://github.com/crytic/slither/wiki/Detector-Documentation#suicidal).

Unprotected call to a function executing selfdestruct/suicide.

## Exploit Scenario:

```
contract Suicidal{
    function kill() public{
        selfdestruct(msg.sender);
    }
}
```

Bob calls kill and destructs the contract.

## Recommendation

Protect access to all sensitive functions.