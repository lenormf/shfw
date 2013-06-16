##
## utils.bash for shfw
## by lenormf
##

INCLUDE_PATH=$(dirname "$_")

source "${INCLUDE_PATH}/string.bash"

function enum {
	local n=0
	for i in "$@"; do
		local up=$(strToUpper "$i")

		eval "${up}=${n}"
		n=$((n + 1))
	done
}

function hiddenInput {
	local old=$(stty -g)

	test $# -gt 0 && echo -n "$@" >&2
	stty -echo
	read _data
	stty "$old"

	echo "$_data"
}

function atexit {
	local f="_out_${atexit_cbs}"

	eval "function $f() { $@; }"

	trap "$f" EXIT && at_number=$((atexit_cbs + 1))
}

atexit_cbs=0
