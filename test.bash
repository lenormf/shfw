#! /usr/bin/env bash
##
## test.bas for shfw
## by lenormf
##

source shfw.bash

function test_01 {
	test $(strLength "abc") -eq 3 || exit 1
}

function test_02 {
	test $(strToLower "AbC") = 'abc' || exit 1
	test $(strToLower "012") = '012' || exit 2
}

function test_03 {
	test $(strToUpper "aBc") = 'ABC' || exit 1
	test $(strToUpper "012") = '012' || exit 2
}

function test_04 {
	for j in $(seq 32 126); do
		local ord=$(strOrd $j)
		local asc=$(strAsc "$ord")

		test $j -eq $asc || exit $j
	done
}

function test_05 {
	local t=( a b c )

	test "$(arrayJoin t ' ')" = 'a b c' || exit 1
}

function test_06 {
	local t=( $(strForEach "abc" echo) )

	test "$(arrayJoin t ' ')" = "a b c" || exit 1
}

function test_07 {
	local t=( $(strSplit "a;b;c" ';') )

	test "$(arrayJoin t ' ')" = 'a b c' || exit 1
}

function test_08 {
	local f=$(mktemp)
	local ret=0

	head -n 77 /dev/urandom > "$f"

	test $(fileLinesNumber "$f") -eq 77 || ret=1

	unlink "$f"

	exit $ret
}

function test_09 {
	local f=$(mktemp)
	local ret=0

	local l=( 'Donnez à ce' 'monsieur une' 'bière et des' 'kiwis')
	for i in "${l[@]}"; do
		echo "$i" >> "$f"
	done
   
	for i in $(seq $((${#l} - 1))); do
		test "$(fileGetLine "$f" $((i + 1)))" = "${l[$i]}" || exit $((i	+ 1))
	done
}

function test_10 {
	test $(urlEncode "$RESERVED_CHARS") = '%23%24%26%27%2B%2C%2F%3A%3B%3D%3F%40%5B%5D' || exit 1
}

function test_11 {
    local array=( "On m'a" "tendu des perches" "et j'ai su" "les saisir" )
    test $(arrayPosItem "tendu des perches" array[@]) = '1'  || exit 1
}

function main {
	for i in $(seq 99); do
		local id=$(printf '%2d' $i | sed 's/ /0/g')

		declare -F | grep -qo test_$id || break
		$(test_$id) || fatal "Test #$i failed (returned $?)" $?
	done

	echo "Tests passed: $((i - 1))"
}

main "$@"
