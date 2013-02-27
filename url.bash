##
## url.bash for shfw
## by lenormf
##

RESERVED_CHARS="#$&'+,/:;=?@[]"

function urlEncode {
	local s="$1"

	for i in $(seq 0 $((${#RESERVED_CHARS} - 1))); do
		local c="${RESERVED_CHARS:$i:1}"
		local hex=$(printf '%X' $(strAsc "$c"))

		test "$c" = "'" || c="\\${c}"
		s=$(echo "$s" | sed "s/${c}/%${hex}/g")
	done

	echo "$s"
}

function urlDecode {
	echo
}
