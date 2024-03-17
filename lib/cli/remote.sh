# shellcheck shell=sh

######################################################################
#<
#
# Function: p6_git_cli_remote_verbose()
#
#>
######################################################################
p6_git_cli_remote_verbose() {
    shift 0

    git remote --verbose "$@"
}
