@echo off

type NUL && "%CODEQL_EXTRACTOR_SOLIDITY_ROOT%\tools\win64\extractor.exe" ^
        extract ^
        --file-list "%1" ^
        --source-archive-dir "%CODEQL_EXTRACTOR_SOLIDITY_SOURCE_ARCHIVE_DIR%" ^
        --output-dir "%CODEQL_EXTRACTOR_SOLIDITY_TRAP_DIR%"

exit /b %ERRORLEVEL%
