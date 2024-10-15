---
slug: /
---


# CyScout

## Run queries and detect vulnerabilities in your smart contracts using CodeQL-Solidity

![alt text](README/output.gif)

This repository contains CoinFabrik's ongoing research and development to extend CodeQL support to the Solidity smart contract language. By leveraging the foundational work done by the CodeQL team for Ruby, we have adapted and expanded their approach to create a powerful toolset for analyzing Solidity code.

## 🔍 Overview

Our goal is to provide a comprehensive set of tools for querying and detecting vulnerabilities in Solidity smart contracts. We build upon the work of [Joran Honig's Solidity Tree-sitter grammar](https://github.com/JoranHonig/tree-sitter-solidity) and the CodeQL team's [Ruby implementation](https://github.blog/security/web-application-security/code-scanning-and-ruby-turning-source-code-into-a-queryable-database/). The project includes an extractor, database schema generation, and abstractions such as a cleaner Abstract Syntax Tree (AST), Control Flow Graph (CFG), and Dataflow analysis. These elements enable complex vulnerability detection and querying, similar to the C++ libraries in CodeQL.

## 🚀 Project Status

- **Extractor and Database Schema**: Usable and functional for Solidity codebases.
- **Current Work**: We are actively developing a cleaner AST, CFG, and Dataflow support to enhance the detection of vulnerabilities.
- **Proof of Concept (PoC)**: Three simple detector examples are provided to demonstrate basic usage and potential.

## 🏁 Getting Started

To get started with analyzing Solidity smart contracts using CodeQL, follow these steps:

### 1️⃣ Install CodeQL CLI

First, download and install the CodeQL CLI by following the instructions provided in the [official CodeQL CLI repository](https://github.com/github/codeql-cli-binaries).

### Clone CodeQL repository

Clone this repository from [CodeQl](https://github.com/github/codeql)

### 2️⃣ Setting up Solidity Extractor

- Go to `codeql-research/solidity/extractor-pack/tools` and give all `.sh` files execute permissions. This is:

```bash
chmod +x *.sh
```

- Copy the `solidity` and `solidity-test` folders of this repository (`codeql-research`) inside `CodeQL CLI repository` and `CodeQL`. Both at root level.

- Inside `CodeQL` repository, in this path `codeql/solidity` run:

```shell
bash scripts/create-extractor-pack.sh
```

<!-- You should see -->
<!--
![output after running create-extractor-pack.sh](/home/cami/codeql-research/static/img/image1.png) --> -->

### 3️⃣ Extract Solidity Code

To create a CodeQL database from a Solidity codebase, run the following command:

```shell
codeql database create /path-to-database/ -l solidity -s /path-to-solidity-codebase/ --search-path /path-to-[solidity/extractor-pack]/
```

If all went smoothly, you should see something of the kind:

```shell

codeql database create /home/user/codeql/solidity-test/test-db-bitshift-examples -l solidity -s /home/user/codeql/solidity-test/bitshift-order-test --search-path ../solidity/extractor-pack --overwrite
Initializing database at /home/user/codeql/solidity-test/test-db-bitshift-examples.
Running build command: []
Running command in /home/user/codeql/solidity-test/bitshift-order-test: [/home/user/codeql/solidity/extractor-pack/tools/autobuild.sh]
[2024-09-03 12:55:56] [build-stderr] Scanning for files in /home/user/codeql/solidity-test/bitshift-order-test...
[2024-09-03 12:55:56] [build-stderr] /home/user/codeql/solidity-test/test-db-bitshift-examples: Indexing files in in /home/user/codeql/solidity-test/bitshift-order-test...
[2024-09-03 12:55:56] [build-stderr] Running command in /home/user/codeql/solidity-test/bitshift-order-test: [/home/user/codeql/solidity/extractor-pack/tools/index-files.sh, /home/user/codeql/solidity-test/test-db-bitshift-examples/working/files-to-index13975833793457248559.list]
[2024-09-03 12:55:56] [build-stdout] [2024-09-03 12:55:56] [build-stdout]  INFO Extraction started
[2024-09-03 12:55:56] [build-stdout] [2024-09-03 12:55:56] [build-stdout]  INFO Using 7 threads
[2024-09-03 12:55:56] [build-stdout] [2024-09-03 12:55:56] [build-stdout]  INFO extracting: /home/user/codeql/solidity-test/bitshift-order-test/remediated.sol
[2024-09-03 12:55:56] [build-stdout] [2024-09-03 12:55:56] [build-stdout]  INFO extracting: /home/user/codeql/solidity-test/bitshift-order-test/vulnerable.sol
[2024-09-03 12:55:56] [build-stdout] [2024-09-03 12:55:56] [build-stdout]  INFO Extraction complete
Finalizing database at /home/user/codeql/solidity-test/test-db-bitshift-examples.
Running TRAP import for CodeQL database at /home/user/codeql/solidity-test/test-db-bitshift-examples...
Importing TRAP files
Merging relations
Finished writing database (relations: 4.86 KiB; string pool: 2.05 MiB).
TRAP import complete (983ms).
Finished zipping source archive (643.00 B).
Successfully created database at /home/user/codeql/solidity-test/test-db-bitshift-examples.

```

### 4️⃣ Run Sample Detectors

Once the database is created, you can run sample detectors written in the QL language:

```bash
codeql query run /path-to-detector/ -d /path-to-created-database/
```

For instance:

```shell
[1/1] Found in cache: /home/user/codeql/solidity/ql/lib/detector3.ql.
detector3.ql: Evaluation completed (191ms).
|      col0       |                                     col1                                     |
+-----------------+------------------------------------------------------------------------------+
| YulFunctionCall | /home/user/codeql/solidity-test/bitshift-order-test/vulnerable.sol@4:18:4:26 |
Shutting down query evaluator.
```

## Detectors

| Num | Detector    | What it Detects                                                      |
| --- | ----------- | -------------------------------------------------------------------- |
| 1   | `detector1` | transferFrom uses arbitrary `from`                  |
| 2   | `detector2` | usage of the word 'FIX' in comments                 |
| 3   | `detector3` | incorrect order of arguments in bit shift operations |
| 4   | `detector3` | Dead code: unreachable basic blocks               |

### Further Documentation

For more detailed instructions on using CodeQL, refer to the [official CodeQL documentation](https://codeql.github.com/docs/).

## 🤝 Contributing

We welcome contributions to enhance and expand the support for Solidity in CodeQL. Feel free to submit issues, feature requests, or pull requests.

## License

The code in this repository is licensed under the [MIT License](README/LICENSE.md) by CoinFabrik.

For further information on CodeQL and CodeQL CLI licensing, please refer to the official [repo](https://github.com/github/codeql-cli-binaries).
