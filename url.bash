##
## url.bash for shfw
## by lenormf
##

RESERVED_CHARS=$'#$&\'+,/:;=?@[]'

function urlEncode {
	local s="$@"

	for i in $(seq 0 $((${#RESERVED_CHARS} - 1))); do
		local c="${RESERVED_CHARS:$i:1}"
		local hex=$(printf '%X' $(printf "%d" "'$c"))

		test "$c" = "'" || c="\\${c}"
		s=${s//${c}/%${hex}}
	done

	echo "$s"
}

function urlDecode {
	echo
}
