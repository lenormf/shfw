##
## log.bash for shfw
## by lenormf
##

function logLevel {
	case "$1" in
		"fatal") log_level=3;;
		"warn") log_level=2;;
		"info") log_level=1;;
		"debug") log_level=0;;
		*) return;;
	esac

	log_level_str="$1"
}

function logPrint {
	local t=$(date)
	test $1 -ge $log_level \
		&& echo "[${log_levels[$1]}][${t}]: $2" >&2
}

function logFatal {
	local ret="$1"

	shift
	logPrint 3 "$@" && exit "$ret"
}

function logWarn {
	logPrint 2 "$@"
}

function logInfo {
	logPrint 1 "$@"
}

function logDebug {
	logPrint 0 "$@"
}

declare -A log_levels
log_levels[0]="debug"
log_levels[1]="info"
log_levels[2]="warn"
log_levels[3]="fatal"

log_level=2
