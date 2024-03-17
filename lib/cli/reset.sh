# shellcheck shell=sh

######################################################################
#<
#
# Function: p6_git_cli_reset_hard_head()
#
#  Environment:	 HEAD
#>
######################################################################
p6_git_cli_reset_hard_head() {
    shift 0

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
