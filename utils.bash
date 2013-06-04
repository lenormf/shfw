##
## utils.bash for shfw
## by lenormf
##

function enum {
	local n=0
	for i in "$@"; do
		eval "${i}=${n}"
		n=$((n + 1))
	done
}

function atexit {
	local f="_out_${atexit_cbs}"

	eval "function $f() { $@; }"

	trap "$f" EXIT && at_number=$((atexit_cbs + 1))
}

atexit_cbs=0
