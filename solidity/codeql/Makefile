CODEQL_COMMIT = 123c375d844b9c2fd9ffcb4315a3f50c6b56f5ae
CODEQL_PATH = codeql

install-for-vscode:
	cd $(CODEQL_PATH)/solidity/ql/lib && codeql pack install

clone-codeql:
	if [ ! -d "$(CODEQL_PATH)" ]; then \
			git clone https://github.com/github/codeql.git; \
	fi
	cd $(CODEQL_PATH) && git checkout $(CODEQL_COMMIT)

copy-solidity: clone-codeql
	cp -r solidity  $(CODEQL_PATH)

build-extractor: copy-solidity
	cd  $(CODEQL_PATH)/solidity && make extractor

create-dbs: build-extractor
	cd solidity-test && ./create-dbs.sh

full-install: build-extractor create-dbs install-for-vscode
