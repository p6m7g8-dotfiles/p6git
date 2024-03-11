# shellcheck shell=sh

######################################################################
#<
#
# Function: p6_git_cli_commit_verbose_with_message()
#
#>
######################################################################
p6_git_cli_commit_verbose_with_message() {
    local msg="$1"

    git commit --verbose -m "$msg"
}

######################################################################
#<
#
# Function: p6_git_cli_commit_last_edit(...)
#
#  Args:
#	... - 
#
#>
######################################################################
p6_git_cli_commit_last_edit() {
    shift 0

    p6_git_cli_commit --amend "$@"
}
