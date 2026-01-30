# shellcheck shell=sh

######################################################################
#<
#
# Function: p6_git_cli_remote_verbose(...)
#
#  Args:
#	... - 
#
#>
######################################################################
p6_git_cli_remote_verbose() {
    shift 0

    p6_git_cli remote --verbose "$@"
}
