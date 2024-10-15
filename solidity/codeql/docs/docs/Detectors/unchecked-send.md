# Unchecked Send

## Description

Based on Slither's [unchecked-send detector](https://github.com/crytic/slither/wiki/Detector-Documentation#unchecked-send).


The return value of a send is not checked.
## Exploit Scenario:

```
contract MyConc{
    function my_func(address payable dst) public payable{
        dst.send(msg.value);
    }
}
```

The return value of send is not checked, so if the send fails, the Ether will be locked in the contract. If send is used to prevent blocking operations, consider logging the failed send.

## Recommendation

Ensure that the return value of send is checked or logged.