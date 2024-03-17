# shellcheck shell=sh

######################################################################
#<
#
# Function: p6_git_cli_commit_with_message()
#
#>
######################################################################
p6_git_cli_commit_with_message() {
    local msg="$1"
    shift 1

    git commit -m "$msg" "$@"
}

######################################################################
#<
#
# Function: p6_git_cli_commit_verbose(...)
#
#  Args:
#	... - 
#
#>
######################################################################
p6_git_cli_commit_verbose() {
    shift 0

    git commit --verbose "$@"
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

    git commit --verbose --amend "$@"
}


