##
## utils.bash for shfw
## by lenormf
##

function fatal {
	echo "$1" >&2 && exit "$2"
}
