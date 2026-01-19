# shellcheck shell=sh

######################################################################
#<
#
# Function: p6_git_cli_reset_hard_head()
#
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
#>
######################################################################
p6_git_cli_reset_head_ago_one() {
    shift 0

    git reset HEAD^ "$@"
}

######################################################################
#<
#
# Function: p6_git_cli_reset_soft_head(n)
#
#  Args:
#	n -
#
#>
######################################################################
p6_git_cli_reset_soft_head() {
    local n="$1"

    git reset --soft HEAD~"$n"
}

