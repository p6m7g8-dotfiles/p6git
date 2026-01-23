#!/bin/sh

main() {

    . ../p6common/lib/_bootstrap.sh
    p6_bootstrap "../p6common"

    ROOT=$(cd "$(dirname "$0")/.." && pwd)

    . "$ROOT/init.zsh"

    p6_test_setup "2"

    p6_test_start "p6df::modules::p6git::deps"
    (
        p6df::modules::p6git::deps
        echo "$ModuleDeps" | grep -q "p6m7g8-dotfiles/p6common" >/dev/null
        p6_test_assert_eq "$?" "0" "deps includes p6common"
    )
    p6_test_finish

    p6_test_start "p6df::modules::p6git::init"
    (
        p6df::modules::p6git::init "p6git" "$ROOT"
        p6_test_assert_eq "$?" "1" "init returns non-zero"
    )
    p6_test_finish

    p6_test_teardown
}

main "$@"
