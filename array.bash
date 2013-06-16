##
## array.bash for shfw
## by lenormf
##

function arrayJoin {
	local res=''
	
	for i in $(eval "echo \${${1}[@]}"); do
		test ! -z "$res" && res="${res}$2"

		res="${res}$i"
	done

	echo "$res"
}

function arrayIsAssociative {
	declare -A | grep -qw "$1"
}

function arrayForEach {
	for i in $(eval "echo \${!${1}[@]}"); do
		$2 "$i" $(eval "echo \${${1}[$i]}")
	done
}

function arrayContains {
	for i in $(eval "echo \${!${1}[@]}"); do
		test $(eval "echo \${${1}[$i]}") = "$2" && return 0
	done

	return 1
}
