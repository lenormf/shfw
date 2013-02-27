##
## utils.bash for shfw
## by lenormf
##

function fatal {
	echo "$1" >&2 && exit "$2"
}

function getDate {
    test $# -ge 1 && date --date "$1 days" "+%Y-%m-%d" || date "+%Y-%m-%d"    
}

function printRed {
    echo -e "\e[01;31m$1\e[0m";
}

function handleError {
    while read line
    do
	printRed "$line"
    done
}

function filterStderr {
    exec 2> >(handleError)
}
