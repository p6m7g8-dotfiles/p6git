#!/bin/sh

main() {

    . ../p6common/lib/_bootstrap.sh
    p6_bootstrap "../p6common"

    . lib/branch.sh
    . lib/cli/branch.sh
    . lib/cli/checkout.sh
    . lib/cli/merge.sh
    . lib/cli/rebase.sh

    p6_test_setup "9"

    p6_test_start "p6_git_cli_branch"
    (
        repo="repo-branch-$$"
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

        p6_git_cli_branch_verbose_verbose >/dev/null 2>&1
        p6_test_assert_eq "$?" "0" "branch_verbose_verbose"

        p6_git_cli_branch_create "feature" >/dev/null 2>&1
        p6_test_assert_eq "$(git rev-parse --abbrev-ref HEAD)" "feature" "branch_create"

        p6_git_cli_checkout "main" >/dev/null 2>&1
        p6_test_assert_eq "$(git rev-parse --abbrev-ref HEAD)" "main" "checkout"

        p6_git_cli_branch_Delete "feature" >/dev/null 2>&1
        git show-ref --verify --quiet refs/heads/feature
        p6_test_assert_eq "$?" "1" "branch_Delete"

        p6_git_cli_branch_create "feature" >/dev/null 2>&1
        echo "feature" >> file.txt
        git add file.txt
        git commit -m "feature" >/dev/null 2>&1
        p6_git_cli_checkout "main" >/dev/null 2>&1
        p6_git_cli_merge "feature" >/dev/null 2>&1
        p6_test_assert_eq "$?" "0" "merge"

        p6_git_cli_branch_create "rebase" >/dev/null 2>&1
        echo "rebase" >> file.txt
        git add file.txt
        git commit -m "rebase" >/dev/null 2>&1
        p6_git_cli_rebase "main" >/dev/null 2>&1
        p6_test_assert_eq "$?" "0" "rebase"

        p6_git_cli_rebase_continue >/dev/null 2>&1
        if [ "$?" -ne 0 ]; then
            p6_test_ok "rebase_continue no-op"
        else
            p6_test_not_ok "rebase_continue no-op"
        fi

        p6_git_cli_rebase_abort >/dev/null 2>&1
        if [ "$?" -ne 0 ]; then
            p6_test_ok "rebase_abort no-op"
        else
            p6_test_not_ok "rebase_abort no-op"
        fi

        p6_git_cli_checkout_default >/dev/null 2>&1
        p6_test_assert_eq "$(git rev-parse --abbrev-ref HEAD)" "main" "checkout_default"
    )
    p6_test_finish

    p6_test_teardown
}

main "$@"
