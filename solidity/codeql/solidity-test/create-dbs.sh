# list every folder in this directory, and run the function "create_db" passing each folder as an argument

create_db() {
    echo -e "\e[1;32mCreating database for $1\e[0m"
    codeql database create --overwrite --search-path ../codeql/solidity/extractor-pack/ -l solidity ./dbs/db-$1 -s ./$1/ > /dev/null 
}


mkdir dbs

for d in */ ; do
    if [ $d = "dbs/" ]; then
        continue
    fi
    create_db $d
done


