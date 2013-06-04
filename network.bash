##
## network.bash for shfw
## by lenormf
##

function networkConnect {
	eval "exec ${1}<>/dev/tcp/${2}/${3}"
}

function networkSend {
	local fd="$1"

	shift
	eval "echo \"$@\" >&${fd}"
}

function networkRead {
	eval "read l <&${1}"

	echo "$l"
}

function networkReadAll {
	local fd="$1"

	shift
	eval "while read l; do $@ \"$l\" done <&${fd}"
}

function networkDisconnect {
	eval "exec ${1}<&-; exec ${1}>&-"
}

test -c /dev/tcp || { echo "No /dev/tcp node detected"; exit 1; }
test -c /dev/udp || { echo "No /dev/udp node detected"; exit 1; }
