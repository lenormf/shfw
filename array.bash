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

function arrayForEach {
	for i in $(eval "echo \${${1}[@]}"); do
		$2 "$i"
	done
}
