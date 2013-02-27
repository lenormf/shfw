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

function arrayPosItem {
    array=("${!2}")
    lengthArray=${#array[@]}

    for ((i=0; i < $lengthArray; ++i))
    do
	test "$1" == "${array[$i]}" && echo $i && return 0
    done

    echo -1 && return 1
}