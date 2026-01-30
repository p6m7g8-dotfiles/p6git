# shellcheck shell=sh

######################################################################
#<
#
# Function: p6_git_cli_restore_stagged(...)
#
#  Args:
#	... - 
#
#>
######################################################################
p6_git_cli_restore_stagged() {
    shift 0

    p6_git_cli restore --staged "$@"
}
