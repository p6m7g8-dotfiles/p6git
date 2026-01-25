# shellcheck shell=sh

######################################################################
#<
#
# Function: p6_git_cli_checkout(...)
#
#  Args:
#	... - 
#
#>
######################################################################
p6_git_cli_checkout() {
    shift 0

    git checkout "$@"
}

######################################################################
#<
#
# Function: p6_git_cli_checkout_default()
#
#>
######################################################################
p6_git_cli_checkout_default() {

    local branch
    branch=$(p6_git_branch_base_get)

    p6_git_cli_checkout "$branch"
}
