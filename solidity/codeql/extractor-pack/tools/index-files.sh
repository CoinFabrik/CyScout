#!/bin/sh

set -eu

exec "${CODEQL_EXTRACTOR_SOLIDITY_ROOT}/tools/${CODEQL_PLATFORM}/extractor" \
        extract \
        --file-list "$1" \
        --source-archive-dir "$CODEQL_EXTRACTOR_SOLIDITY_SOURCE_ARCHIVE_DIR" \
        --output-dir "$CODEQL_EXTRACTOR_SOLIDITY_TRAP_DIR"
