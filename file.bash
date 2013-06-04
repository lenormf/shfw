##
## file.bash for shfw
## by lenormf
##

function fileReadAll {
	while read l; do
		$2 "$l"
	done < "$1"
}

function fileGetLine {
	sed -n "$2 p" "$1"
}

function fileLinesNumber {
	sed -n '$=' "$1"
}

function fileExists {
	test -f "$1"
	return
}
