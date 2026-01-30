# shellcheck shell=sh

######################################################################
#<
#
# Function: p6_git_cli_pull_rebase_autostash_ff_only()
#
#>
######################################################################
p6_git_cli_pull_rebase_autostash_ff_only() {

    p6_git_cli pull --rebase --autostash --ff-only
}
