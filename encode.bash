##
## encode.bash for shfw
## by lenormf
##

function encodeMd5 {
	echo -n "$@" | md5sum - | cut -d ' ' -f 1
}

function encodeSha1 {
	echo -n "$@" | sha1sum | cut -d ' ' -f 1
}

function encodeSha256 {
	echo -n "$@" | sha256sum | cut -d ' ' -f 1
}

function encodeSha512 {
	echo -n "$@" | sha512sum | cut -d ' ' -f 1
}
