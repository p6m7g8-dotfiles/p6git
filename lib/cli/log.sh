# shellcheck shell=sh

######################################################################
#<
#
# Function: p6_git_cli_log_since()
#
#>
######################################################################
p6_git_cli_log_since() {
    local since="$1"
    local fmt="${2:-format:%h %ci %al %d %s}"

    git log --since "$since" --pretty="$fmt"
}
