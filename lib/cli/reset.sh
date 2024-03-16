# shellcheck shell=sh

######################################################################
#<
#
# Function: p6_git_cli_reset_head_hard()
#
#>
######################################################################
p6_git_cli_reset_hard_head() {

    git reset --hard HEAD "$@"
}

######################################################################
#<
#
# Function: p6_git_cli_reset_head_ago_one(...)
#
#  Args:
#	... - 
#
#  Environment:	 HEAD
#>
######################################################################
p6_git_cli_reset_head_ago_one() {
    shift 0

    git reset HEAD^ "$@"
}
