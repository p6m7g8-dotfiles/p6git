#!/bin/sh

main() {

    . ../p6common/lib/_bootstrap.sh
    p6_bootstrap "../p6common"

    . lib/cli/remote.sh

    p6_test_setup "1"

    p6_test_start "p6_git_cli_remote_verbose"
    (
        repo="repo-remote-$$"
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

        mkdir -p ../origin/org
        git init --bare ../origin/org/repo.git >/dev/null 2>&1
        git remote add origin "../origin/org/repo.git"

        out=$(p6_git_cli_remote_verbose)
        echo "$out" | grep -q "origin" >/dev/null
        p6_test_assert_eq "$?" "0" "remote_verbose"
    )
    p6_test_finish

    p6_test_teardown
}

main "$@"
