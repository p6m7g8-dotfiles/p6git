#!/bin/sh

main() {

    . ../p6common/lib/_bootstrap.sh
    p6_bootstrap "../p6common"

    ROOT=$(cd "$(dirname "$0")/.." && pwd)
    DOTFILES_DIR=$(cd "$ROOT/.." && pwd)

    . lib/util.sh
    . lib/branch.sh
    . lib/cli/status.sh
    . lib/cli/diff.sh
    . lib/cli/log.sh
    . lib/cli/checkout.sh

    p6_test_setup "13"

    p6_test_start "p6_git_util_basic"
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

        repo_dir=$(pwd)
        mkdir -p ../origin/org
        git init --bare ../origin/org/repo.git >/dev/null 2>&1
        git remote add origin "../origin/org/repo.git"

        out=$(zsh -c "cd \"$repo_dir\"; . \"$DOTFILES_DIR/p6common/lib/_bootstrap.sh\"; p6_bootstrap \"$DOTFILES_DIR/p6common\"; . \"$ROOT/lib/util.sh\"; p6_git_util_repo_from_origin")
        p6_test_assert_eq "$out" "repo" "repo_from_origin"

        out=$(zsh -c "cd \"$repo_dir\"; . \"$DOTFILES_DIR/p6common/lib/_bootstrap.sh\"; p6_bootstrap \"$DOTFILES_DIR/p6common\"; . \"$ROOT/lib/util.sh\"; p6_git_util_org_from_origin")
        p6_test_assert_eq "$out" "org" "org_from_origin"

        p6_test_assert_not_blank "$(p6_git_util_sha_short_get)" "sha_short_get"

        p6_git_util_dirty_get
        if [ "$?" -ne 0 ]; then
            p6_test_ok "dirty_get clean"
        else
            p6_test_not_ok "dirty_get clean"
        fi

        echo "dirty" > dirty.txt
        p6_git_util_dirty_get
        if [ "$?" -ne 0 ]; then
            p6_test_ok "dirty_get dirty"
        else
            p6_test_not_ok "dirty_get dirty"
        fi

        p6_git_util_inside_tree
        p6_test_assert_eq "$?" "0" "inside_tree"

        p6_test_assert_eq "$(p6_git_util_symbolic_ref HEAD)" "main" "symbolic_ref"

        out=$(p6_git_util_log)
        p6_test_assert_not_blank "$out" "util_log output"

        p6_test_run "p6_git_util_diff_default"
        p6_test_assert_run_rc "diff_default" 0

        git checkout -b feature >/dev/null 2>&1
        p6_git_util_checkout_default
        p6_test_assert_eq "$(p6_git_branch_get)" "main" "checkout_default"
    )
    p6_test_finish

    p6_test_start "p6_git_util_msg_collect"
    (
        repo="repo-msg-$$"
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

        path=$(p6_git_util_msg_collect ":" "hello")
        p6_test_assert_file_exists "$path" "msg_collect creates file"
        grep -q "hello" "$path" >/dev/null
        p6_test_assert_eq "$?" "0" "msg_collect keeps msg"
    )
    p6_test_finish

    p6_test_start "p6_git_util_shas_for_string"
    (
        repo="repo-sha-$$"
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
        echo "two" >> file.txt
        git add file.txt
        git commit -m "second" >/dev/null 2>&1

        p6_test_run "p6_git_util_shas_for_string file.txt two"
        p6_test_assert_run_rc "shas_for_string" 0
    )
    p6_test_finish

    p6_test_teardown
}

main "$@"
