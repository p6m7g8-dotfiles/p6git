#!/bin/sh

main() {

    . ../p6common/lib/_bootstrap.sh
    p6_bootstrap "../p6common"

    funcs="p6_git_util_clobber p6_git_util_sync p6_git_util_update p6_git_util_commit_push_squashed_fix p6_git_util_commit_push_fix"
    set -- $funcs
    p6_test_setup "$#"

    p6_test_start "util network calls"
    (
        for func in $funcs; do
            p6_test_tap_skip "$func" "network"
        done
    )
    p6_test_finish

    p6_test_teardown
}

main "$@"
