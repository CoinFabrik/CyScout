# Contribute

Thank you for your interest in contributing to the development of new detectors.

### Getting Started

Create a new issue on our [repository](https://github.com/CoinFabrik/CyScout) with the name of the new detector or test case you wish to contribute. Then, link a new branch to that issue.

### Detectors

In order to build a custom detector, you need to first import all static analysis primitives you need to use.

- `import codeql.solidity.ast.AST` for AST language constructs (binary, unary and tertiary operations, control statements, loops, functions, contracts, etc.)

- `import codeql.solidity.controlflow.ControlFlowGraph` for CFG constructs (SSA, basic blocks, control flow nodes, etc.)

- `import codeql.solidity.dataflow.DataFlow` for DFA constructs (to define sinks and sources for local flow analysis)

For global data flow analysis, you must write a class that implements DataFlow::ConfigSig. Refer to our global flow example or to the official codeQL guide for more information on this specific case.

### Test Cases

When you create a new detector, please also add a new test case. To add a new one:

1. Create a new folder in the [`tests`](https://github.com/CoinFabrik/stacy/tree/main/tests) directory. **Remember to follow the snake_case/underscore naming convention for the folder name**.

2. Within this folder, create two directories: `vulnerable-example` and `remediated-example`. Fill each with the relevant files for their respective test cases. 

For guidance, refer to the `detector_name` template in [`templates/test-case`](https://github.com/CoinFabrik/stacy/tree/main/templates/tests).