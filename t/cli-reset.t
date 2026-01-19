#!/bin/sh

main() {

    . ../p6common/lib/_bootstrap.sh
    p6_bootstrap "../p6common"

    . lib/cli/clean.sh
    . lib/cli/reset.sh
    . lib/cli/revert.sh

    p6_test_setup "5"

    p6_test_start "p6_git_cli_reset_soft_head"
    (
        repo="repo-reset-soft-$$"
        mkdir -p "$repo"
        cd "$repo" || exit 1

        git init -b main >/dev/null 2>&1 || git init >/dev/null 2>&1
        git config user.email "test@example.com"
        git config user.name "Test User"
        git config commit.gpgsign false
        echo "one" > file.txt
        git add file.txt
        git commit -m "init" >/dev/null 2>&1
        echo "two" >> file.txt
        git add file.txt
        git commit -m "second" >/dev/null 2>&1
        git branch -m main >/dev/null 2>&1

        p6_git_cli_reset_soft_head "1" >/dev/null 2>&1
        git status -s | grep -q "M  file.txt" >/dev/null
        p6_test_assert_eq "$?" "0" "reset_soft_head"
    )
    p6_test_finish

    p6_test_start "p6_git_cli_reset_head_ago_one_and_hard"
    (
        repo="repo-reset-hard-$$"
        mkdir -p "$repo"
        cd "$repo" || exit 1

        git init -b main >/dev/null 2>&1 || git init >/dev/null 2>&1
        git config user.email "test@example.com"
        git config user.name "Test User"
        git config commit.gpgsign false
        echo "one" > file.txt
        git add file.txt
        git commit -m "init" >/dev/null 2>&1
        echo "two" >> file.txt
        git add file.txt
        git commit -m "second" >/dev/null 2>&1
        git branch -m main >/dev/null 2>&1

        p6_git_cli_reset_head_ago_one >/dev/null 2>&1
        git log -1 --pretty=%s | grep -q "init" >/dev/null
        p6_test_assert_eq "$?" "0" "reset_head_ago_one"

        echo "three" >> file.txt
        p6_git_cli_reset_hard_head >/dev/null 2>&1
        out=$(git status -s)
        p6_test_assert_blank "$out" "reset_hard_head"
    )
    p6_test_finish

    p6_test_start "p6_git_cli_revert_clean"
    (
        repo="repo-revert-$$"
        mkdir -p "$repo"
        cd "$repo" || exit 1

        git init -b main >/dev/null 2>&1 || git init >/dev/null 2>&1
        git config user.email "test@example.com"
        git config user.name "Test User"
        git config commit.gpgsign false
        echo "one" > file.txt
        git add file.txt
        git commit -m "init" >/dev/null 2>&1
        git branch -m main >/dev/null 2>&1

        p6_git_cli_revert --no-edit HEAD >/dev/null 2>&1
        git log -1 --pretty=%s | grep -q "Revert" >/dev/null
        p6_test_assert_eq "$?" "0" "revert"

        echo "junk" > junk.txt
        p6_git_cli_clean_fdx >/dev/null 2>&1
        p6_test_assert_file_not_exists "junk.txt" "clean_fdx"
    )
    p6_test_finish

    p6_test_teardown
}

main "$@"
