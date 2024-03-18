# shellcheck shell=sh

######################################################################
#<
#
# Function: p6_git_cli_branch_verbose_verbose()
#
#>
######################################################################
p6_git_cli_branch_verbose_verbose() {
    shift 0

    git branch --verbose --verbose "$@"
}

######################################################################
#<
#
# Function: p6_git_cli_branch_create(...)
#
#  Args:
#	... - 
#
#>
######################################################################
p6_git_cli_branch_create() {
    shift 0

    p6_git_cli_checkout -b "$@"
}

######################################################################
#<
#
# Function: p6_git_cli_branch_Delete(...)
#
#  Args:
#	... - 
#
#>
######################################################################
p6_git_cli_branch_Delete() {
    shift 0

    p6_git_cli_branch_verbose_verbose -D "$@"
}
