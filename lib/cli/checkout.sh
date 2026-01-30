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

    p6_git_cli checkout "$@"
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
