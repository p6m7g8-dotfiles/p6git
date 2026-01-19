#!/bin/sh

main() {

    . ../p6common/lib/_bootstrap.sh
    p6_bootstrap "../p6common"

    . lib/util.sh
    . lib/branch.sh

    p6_test_setup "5"

    p6_test_start "p6_git_branch_*"
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

        p6_test_assert_eq "$(p6_git_branch_get)" "main" "branch_get"
        p6_test_assert_eq "$(p6_git_branch_base_get)" "main" "branch_base_get"
        p6_test_assert_eq "$(p6_git_branch_p6_get)" "USER/KIND/PRN/REST#PREFIXSUFFIX" "branch_p6_get"
        p6_test_assert_eq "$(p6_git_branch_flast_get)" "USER-PRN-REST" "branch_flast_get"

        branch=$(p6_git_branch_process "USER/KIND/PRN/REST#PREFIXSUFFIX" "me" "feat(api): add thing" "123")
        p6_test_assert_eq "$branch" "me/feat/api/123/add_thing#PREFIXSUFFIX" "branch_process"
    )
    p6_test_finish

    p6_test_teardown
}

main "$@"
