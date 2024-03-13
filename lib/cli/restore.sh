# shellcheck shell=sh

######################################################################
#<
#
# Function: p6_git_cli_restore_stagged()
#
#>
######################################################################
p6_git_cli_restore_stagged() {
    shift 0

    git restore --staged "$@"
}
