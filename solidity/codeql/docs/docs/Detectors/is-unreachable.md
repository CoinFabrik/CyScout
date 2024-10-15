## Is unreachable

## Usage

```bash
codeql query run codeql-research/solidity/ql/lib/is-unreachable.ql -d /path-to-database/
```

## Description
Detects dead code on a CFG level, in the form of unreachable basic blocks.

### Recomendation
Eliminate code that can't be executed and thus has no effect in 
the logic of the final program.

## Example

### Vulnerable
```javascript
contract A{  
    function a(uint256 t) public {
        if(false)
        {
            revert();
        }
    }
}
```

### Fixed
```javascript
contract A{  
    function a(uint256 t) public {
        // if(false)
        {
            revert();
        }
    }
}
```