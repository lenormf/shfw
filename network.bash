##
## network.bash for shfw
## by lenormf
##

function networkConnect {
	exec $1<>"/dev/tcp/${2}/${3}"
}

function networkSend {
	echo "$2" >&"$1"
}

function networkRead {
	read l <&"$1"

	echo "$l"
}

function networkReadAll {
	while read l; do
		$2 "$l"
	done <&"$1"
}

function networkDisconnect {
	exec "$1"<&-
	exec "$1">&-
}
