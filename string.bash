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
	echo "$1" | tr '[A-Z]' '[a-z]'
}

function strToUpper {
	echo "$1" | tr '[a-z]' '[A-Z]'
}

function strAsc {
	printf '%d' "'$1" && echo
}

function strOrd {
	printf '\x'$(printf '%x' "$1") && echo
}

function strCount {
	echo "$1" | grep -o "$2" | wc -l
}

function strSplit {
	echo "$1" | tr "$2" '\n'
}
