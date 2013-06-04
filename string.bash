##
## string.bash for shfw
## by lenormf
##

function strLength {
	echo ${#1}
}

function strForEach {
	local s="$1"

	for i in $(seq 0 $(($(strLength "$s") - 1))); do
		$2 ${s:$i:1}
	done
}

function strToLower {
	local -l low="$@"
	echo "$low"
}

function strToUpper {
	local -u up="$@"
	echo "$up"
}

function strAsc {
	printf '%d' "'$@" && echo
}

function strOrd {
	printf '\x'$(printf '%x' "$@") && echo
}

function strCount {
	echo "$1" | grep -o "$2" | wc -l
}

function strSplit {
	echo "$1" | tr "$2" '\n'
}
