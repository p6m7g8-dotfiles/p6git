#!/bin/sh

main() {

    . ../p6common/lib/_bootstrap.sh
    p6_bootstrap "../p6common"

    funcs="p6_git_cli_fetch_all p6_git_cli_pull_rebase_autostash_ff_only p6_git_cli_push_u p6_git_cli_push_fu p6_git_cli_push_tags p6_git_cli_clone"
    set -- $funcs
    p6_test_setup "$#"

    p6_test_start "cli network calls"
    (
        for func in $funcs; do
            p6_test_tap_skip "$func" "network"
        done
    )
    p6_test_finish

    p6_test_teardown
}

main "$@"
