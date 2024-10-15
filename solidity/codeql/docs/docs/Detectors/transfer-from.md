## transfer-from uses arbitrary `from`

## Usage

```bash
codeql query run codeql-research/solidity/ql/lib/slither-arbitrary-send-erc20.ql -d /path-to-database/
```

## Description
Based on the [arbitrary-send-erc20](https://github.com/crytic/slither/wiki/Detector-Documentation#arbitrary-from-in-transferfrom) detector from Slither.
Detects wrongful usage of an arbitrary `from` variable
in a transfer call.

### Recomendation
Use `msg.sender` instead.

## Example

### Vulnerable
```javascript
contract A{  
    function a(address from, address to, uint256 amount) public {
        erc20.transferFrom(from, to, amount);
    }
}
```

### Fixed
```javascript
contract A{  
    function a(address from, address to, uint256 amount) public {
        erc20.transferFrom(msg.sender, to, amount);
    }
}
```