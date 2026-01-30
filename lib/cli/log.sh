# shellcheck shell=sh

######################################################################
#<
#
# Function: p6_git_cli_log_since(since, [fmt=format:%h %ci %al %d %s])
#
#  Args:
#	since -
#	OPTIONAL fmt - [format:%h %ci %al %d %s]
#
#>
######################################################################
p6_git_cli_log_since() {
    local since="$1"
    local fmt="${2:-format:%h %ci %al %d %s}"

    p6_git_cli log --since "$since" --pretty="$fmt"
}

######################################################################
#<
#
# Function: p6_git_cli_log_shas(file)
#
#  Args:
#	file -
#
#>
######################################################################
p6_git_cli_log_shas() {
    local file="$1"

    p6_git_cli log --format="%H" -- "$file"
}
