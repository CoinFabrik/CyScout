@echo off

type NUL && "%CODEQL_DIST%\codeql.exe" database index-files ^
    --prune=**/*.testproj ^
    --include-extension=.rb ^
    --include-extension=.erb ^
    --include-extension=.gemspec ^
    --include=**/Gemfile ^
    --size-limit=5m ^
    --language=solidity ^
    --working-dir=. ^
    "%CODEQL_EXTRACTOR_SOLIDITY_WIP_DATABASE%"

exit /b %ERRORLEVEL%
