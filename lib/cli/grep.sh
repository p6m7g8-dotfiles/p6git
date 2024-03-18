# shellcheck shell=sh

######################################################################
#<
#
# Function: p6_git_cli_grep_files()
#
#>
######################################################################
p6_git_cli_grep_files() {
    shift 0

    git grep --files-with-match "$@"
}

######################################################################
#<
#
# Function: p6_git_cli_grep(...)
#
#  Args:
#	... - 
#
#>
######################################################################
p6_git_cli_grep() {
    shift 0

    git grep --word-regexp "$@"
}