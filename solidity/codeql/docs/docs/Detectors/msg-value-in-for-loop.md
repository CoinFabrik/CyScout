## msg.value in for loops

## Usage

First you need to create the solidity database for the smart contract.

```bash

 codeql database create {your_path}/solidity-test/test-msg-value-db -l solidity -s {your_path}/solidity-test/solidity-msg-value --search-path {your_path}/solidity/extractor-pack

```

Once you have the database, you can run the detector 

``` bash

codeql query run {your_path}/solidity/ql/lib/msg-value-in-loop.ql -d {your_path}/solidity-test/test-msg-value-db

```

## Description

This detector checks if `msg.value` is inside a for loop. Since `msg.value` is a constant value, it does not change during an iteration and it can produce unwanted behaviour if used incorrectly.


### Recomendation

It is recommended to use `msg.value` only once.


