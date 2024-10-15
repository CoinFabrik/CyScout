## Incorrect shift in assembly

## Usage

```bash
codeql query run codeql-research/solidity/ql/lib/slither-bitshift-order.ql -d /path-to-database/
```

## Description
Based on Slither's [incorrect-shift detector](https://github.com/crytic/slither/wiki/Detector-Documentation#incorrect-shift-in-assembly).
Detects if the values in a shift operation are reversed.

### Recomendation
Invert the order of call arguments
to correctly perform the shift operation.

## Example

### Vulnerable
```javascript
contract C {
    function f() internal returns (uint a) {
        assembly {
            a := shr(a, 8)
        }
    }
}
```

### Fixed
```javascript
contract C {
    function f() internal returns (uint a) {
        assembly {
            a := shr(8, a)
        }
    }
}
```