##
## url.bash for shfw
## by lenormf
##

INCLUDE_PATH=$(dirname "$_")

source "${INCLUDE_PATH}/string.bash"

RESERVED_CHARS=$'#$&\'+,/:;=?@[]- '

function urlEncode {
	local s="$@"

	for i in $(seq 0 $((${#RESERVED_CHARS} - 1))); do
		local c="${RESERVED_CHARS:$i:1}"
		local hex=$(strHex $(strAsc "$c"))

		test "$c" = "'" || c="\\${c}"
		s=${s//${c}/%${hex}}
	done

	echo "$s"
}

function urlDecode {
	local s="$@"
	local t=( $(echo "$s" | egrep -o '%[A-Z0-9]{2}' | uniq) )

	for i in "${t[@]}"; do
		local l=$(printf '\x'${i:1:2}'\n')
		s=$(echo "$s" | sed "s/${i}/${l}/g")
	done

	echo "$s"
}
