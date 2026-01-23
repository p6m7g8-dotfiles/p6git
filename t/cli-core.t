#!/bin/sh

main() {

    . ../p6common/lib/_bootstrap.sh
    p6_bootstrap "../p6common"

    . lib/cli/add.sh
    . lib/cli/commit.sh
    . lib/cli/diff.sh
    . lib/cli/log.sh
    . lib/cli/grep.sh
    . lib/cli/restore.sh
    . lib/cli/status.sh

    p6_test_setup "13"

    p6_test_start "p6_git_cli_core"
    (
        repo="repo-$$"
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

        out=$(p6_git_cli_status_s)
        p6_test_assert_blank "$out" "status clean"

        echo "new" > new.txt
        p6_git_cli_add "new.txt"
        git status -s | grep -q "A  new.txt" >/dev/null
        p6_test_assert_eq "$?" "0" "add stages file"

        p6_git_cli_restore_stagged "new.txt"
        git status -s | grep -q "\?\? new.txt" >/dev/null
        p6_test_assert_eq "$?" "0" "restore_stagged unstages"

        p6_git_cli_add_all
        p6_git_cli_commit_with_message "feat: one" >/dev/null 2>&1
        git log -1 --pretty=%s | grep -q "feat: one" >/dev/null
        p6_test_assert_eq "$?" "0" "commit_with_message"

        echo "two" >> file.txt
        p6_git_cli_add_all
        p6_git_cli_commit_verbose -m "feat: two" >/dev/null 2>&1
        git log -1 --pretty=%s | grep -q "feat: two" >/dev/null
        p6_test_assert_eq "$?" "0" "commit_verbose"

        echo "three" >> file.txt
        p6_git_cli_add_all
        p6_git_cli_commit_squash >/dev/null 2>&1
        git log -1 --pretty=%s | grep -q "feat: two" >/dev/null
        p6_test_assert_eq "$?" "0" "commit_squash"

        echo "four" >> file.txt
        p6_git_cli_add_all
        GIT_EDITOR=true p6_git_cli_commit_last_edit >/dev/null 2>&1
        git log -1 --pretty=%s | grep -q "feat: two" >/dev/null
        p6_test_assert_eq "$?" "0" "commit_last_edit"

        echo "diff" >> file.txt
        out=$(p6_git_cli_diff_head)
        echo "$out" | grep -q "diff --git" >/dev/null
        p6_test_assert_eq "$?" "0" "diff_head"

        out=$(p6_git_cli_diff_previous)
        echo "$out" | grep -q "diff --git" >/dev/null
        p6_test_assert_eq "$?" "0" "diff_previous"

        out=$(p6_git_cli_log_since "1 day ago")
        p6_test_assert_not_blank "$out" "log_since"

        out=$(p6_git_cli_log_shas "file.txt")
        p6_test_assert_not_blank "$out" "log_shas"

        echo "needle" > grep.txt
        p6_git_cli_add_all
        p6_git_cli_commit_with_message "add grep" >/dev/null 2>&1
        out=$(p6_git_cli_grep_files "needle")
        echo "$out" | grep -q "grep.txt" >/dev/null
        p6_test_assert_eq "$?" "0" "grep_files"

        out=$(p6_git_cli_grep "needle")
        echo "$out" | grep -q "needle" >/dev/null
        p6_test_assert_eq "$?" "0" "grep"
    )
    p6_test_finish

    p6_test_teardown
}

main "$@"
