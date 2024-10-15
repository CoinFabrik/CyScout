#!/bin/bash
set -eux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  platform="linux64"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  platform="osx64"
else
  echo "Unknown OS"
  exit 1
fi

(cd extractor && cargo build --release)

BIN_DIR=extractor/target/release
"$BIN_DIR/codeql-extractor-solidity" generate --dbscheme ql/lib/solidity.dbscheme --library ql/lib/codeql/solidity/ast/internal/TreeSitter.qll

codeql query format -i ql/lib/codeql/solidity/ast/internal/TreeSitter.qll

rm -rf extractor-pack
mkdir -p extractor-pack
# cp -r codeql-extractor.yml downgrades tools ql/lib/solidity.dbscheme ql/lib/solidity.dbscheme.stats extractor-pack/
cp -r codeql-extractor.yml tools ql/lib/solidity.dbscheme ql/lib/solidity.dbscheme.stats extractor-pack/
mkdir -p extractor-pack/tools/${platform}
cp "$BIN_DIR/codeql-extractor-solidity" extractor-pack/tools/${platform}/extractor
