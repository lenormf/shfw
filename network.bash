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

function networkReadBinary {
    dd bs="$1" count="$2" <&"$3" 2>/dev/null
}

function networkServerIsUp() {
	timestamp=$(date +%s)
	timestop=$((timestamp + "$4"))

	while [ $(date +%s) -le $timestop ];
	do
	    networkConnect "$1" "$2" "$3" && networkDisconnect "$3" && return 1
	    sleep 1
	done
	
	return 0
}
