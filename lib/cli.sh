# shellcheck shell=sh
######################################################################
#<
#
# Function: code rc = p6_git_cmd(cmd, ...)
#
#  Args:
#	cmd -
#	... -
#
#  Returns:
#	code - rc
#
#>
######################################################################
p6_git_cmd() {
    local cmd="$1"
    shift 1

    p6_run_code "git $cmd $*"
    local rc=$?

    p6_return_code_as_code "$rc"
}

######################################################################
#<
#
# Function: p6_git_p6_restore(...)
#
#  Args:
#	... -
#
#>
######################################################################
p6_git_p6_restore() {
    shift 0

    p6_git_cmd restore --staged "$@"
}
######################################################################
#<
#
# Function: p6_git_p6_status(...)
#
#  Args:
#	... -
#
#>
######################################################################
p6_git_p6_status() {
    shift 0

    p6_git_cmd status --ignore-submodules="${_git_status_ignore_submodules:-}" "$@"
}

######################################################################
#<
#
# Function: p6_git_p6_diff(...)
#
#  Args:
#	... -
#
#>
######################################################################
p6_git_p6_diff() {
    shift 0

    p6_git_cmd diff --no-ext-diff "$@"
}

######################################################################
#<
#
# Function: p6_git_p6_diff_default(...)
#
#  Args:
#	... -
#
#>
######################################################################
p6_git_p6_diff_default() {
    shift 0

    local branch
    branch=$(p6_git_branch_base_get)

    p6_git_p6_diff "$branch" "$@"
}

######################################################################
#<
#
# Function: p6_git_p6_diff_previous(...)
#
#  Args:
#	... -
#
#>
######################################################################
p6_git_p6_diff_previous() {
    shift 0

    p6_git_p6_diff "HEAD^" "$@"
}

######################################################################
#<
#
# Function: p6_git_p6_rebase(...)
#
#  Args:
#	... -
#
#>
######################################################################
p6_git_p6_rebase() {
    shift 0

    p6_git_cmd rebase "$@"
}

######################################################################
#<
#
# Function: p6_git_p6_rebase_continue()
#
#>
######################################################################
p6_git_p6_rebase_continue() {

    p6_git_p6_rebase --continue
}

######################################################################
#<
#
# Function: p6_git_p6_rebase_abort()
#
#>
######################################################################
p6_git_p6_rebase_abort() {

    p6_git_p6_rebase --abort
}

######################################################################
#<
#
# Function: p6_git_p6_reset(...)
#
#  Args:
#	... -
#
#>
######################################################################
p6_git_p6_reset() {
    shift 0

    p6_git_cmd reset "$@"
}

######################################################################
#<
#
# Function: p6_git_p6_clean(...)
#
#  Args:
#	... -
#
#>
######################################################################
p6_git_p6_clean() {
    shift 0

    p6_git_cmd clean "-fdx" "$@"
}

######################################################################
#<
#
# Function: p6_git_p6_git_reset_head_hard()
#
#>
######################################################################
p6_git_p6_git_reset_head_hard() {

    p6_git_p6_reset --head --hard
}

######################################################################
#<
#
# Function: p6_git_p6_diff_head(...)
#
#  Args:
#	... -
#
#>
######################################################################
p6_git_p6_diff_head() {
    shift 0

    p6_git_p6_diff "HEAD" "$@"
}

######################################################################
#<
#
# Function: p6_git_p6_log(...)
#
#  Args:
#	... -
#
#>
######################################################################
p6_git_p6_log() {
    shift 0

    local branch
    branch=$(p6_git_branch_get)
    local base
    base=$(p6_git_branch_base_get)

    local count
    if p6_string_eq "master" "$branch"; then
        count=-10
    elif p6_string_eq "main" "$branch"; then
        count=-10
    elif p6_string_eq "DETACHED" "$branch"; then
        count=-10
    elif p6_string_blank "$branch"; then
        count=-10
    else
        count="${base}..${branch}"
    fi

    git log \
	--pretty="format:%Cred%h%Creset %Cgreen(%cD) %C(bold blue)<%al>%Creset %C(yellow)%d%Creset %s" \
        "$count" \
        "$@"
}

######################################################################
#<
#
# Function: str symbol = p6_git_p6_symbolic_ref(ref)
#
#  Args:
#	ref -
#
#  Returns:
#	str - symbol
#
#>
######################################################################
p6_git_p6_symbolic_ref() {
    local ref="$1"

    local symbol
    symbol=$(git symbolic-ref "$ref" 2>/dev/null)

    symbol=$(p6_echo "$symbol" | sed -e 's,.*/,,')

    p6_return_str "$symbol"
}

######################################################################
#<
#
# Function: p6_git_p6_checkout(...)
#
#  Args:
#	... -
#
#>
######################################################################
p6_git_p6_checkout() {
    shift 0

    p6_git_cmd checkout "$@"
}

######################################################################
#<
#
# Function: p6_git_p6_checkout_default()
#
#>
######################################################################
p6_git_p6_checkout_default() {

    local branch
    branch=$(p6_git_branch_base_get)

    p6_git_p6_checkout "$branch"
}

######################################################################
#<
#
# Function: p6_git_p6_branch(...)
#
#  Args:
#	... -
#
#>
######################################################################
p6_git_p6_branch() {
    shift 0

    p6_git_cmd branch --verbose --verbose "$@"
}

######################################################################
#<
#
# Function: p6_git_p6_branch_create(...)
#
#  Args:
#	... -
#
#>
######################################################################
p6_git_p6_branch_create() {
    shift 0

    p6_git_p6_checkout -b "$@"
}

######################################################################
#<
#
# Function: p6_git_p6_pull()
#
#>
######################################################################
p6_git_p6_pull() {

    p6_git_cmd pull --rebase --autostash --ff-only
}

######################################################################
#<
#
# Function: p6_git_p6_push(...)
#
#  Args:
#	... -
#
#>
######################################################################
p6_git_p6_push() {
    shift 0

    p6_git_cmd push -u "$@"
}

######################################################################
#<
#
# Function: p6_git_p6_push_f()
#
#>
######################################################################
p6_git_p6_push_f() {

    p6_git_p6_push -f
}
######################################################################
#<
#
# Function: p6_git_p6_push_tags(...)
#
#  Args:
#	... -
#
#>
######################################################################
p6_git_p6_push_tags() {
    shift 0

    p6_git_cmd push --tags "$@"
}

######################################################################
#<
#
# Function: p6_git_p6_sync()
#
#>
######################################################################
p6_git_p6_sync() {

    p6_git_p6_pull &&
        p6_git_p6_push
}

######################################################################
#<
#
# Function: p6_git_p6_merge(...)
#
#  Args:
#	... -
#
#>
######################################################################
p6_git_p6_merge() {
    shift 0

    p6_git_cmd merge "$@"
}

######################################################################
#<
#
# Function: p6_git_p6_reset_head_hard(...)
#
#  Args:
#	... -
#
#>
######################################################################
p6_git_p6_reset_head_hard() {
    shift 0

    p6_git_cmd reset HEAD --hard "$@"
}

######################################################################
#<
#
# Function: p6_git_p6_reset_head_ago_one(...)
#
#  Args:
#	... -
#
#>
######################################################################
p6_git_p6_reset_head_ago_one() {
    shift 0

    p6_git_cmd reset HEAD^ "$@"
}

######################################################################
#<
#
# Function: p6_git_p6_stash_list()
#
#>
######################################################################
p6_git_p6_stash_list() {

    p6_git_cmd stash list
}

######################################################################
#<
#
# Function: p6_git_p6_remote()
#
#>
######################################################################
p6_git_p6_remote() {

    p6_git_cmd remote --verbose
}

######################################################################
#<
#
# Function: p6_git_p6_add(...)
#
#  Args:
#	... -
#
#>
######################################################################
p6_git_p6_add() {
    shift 0

    p6_git_cmd add "$@"
}

######################################################################
#<
#
# Function: p6_git_p6_add_all()
#
#>
######################################################################
p6_git_p6_add_all() {

    p6_git_p6_add .
}

######################################################################
#<
#
# Function: p6_git_p6_commit(msg)
#
#  Args:
#	msg -
#
#>
######################################################################
p6_git_p6_commit() {
    local msg="$1"

    git commit --verbose -m "$msg"
}

######################################################################
#<
#
# Function: p6_git_p6_commit_last_edit(...)
#
#  Args:
#	... -
#
#>
######################################################################
p6_git_p6_commit_last_edit() {
    shift 0

    p6_git_p6_commit --amend "$@"
}

######################################################################
#<
#
# Function: p6_git_p6_fetch(...)
#
#  Args:
#	... -
#
#>
######################################################################
p6_git_p6_fetch() {
    shift 0

    p6_git_cmd fetch --all "$@"
}

######################################################################
#<
#
# Function: p6_git_p6_clone(...)
#
#  Args:
#	... -
#
#>
######################################################################
p6_git_p6_clone() {
    shift 0

    p6_git_cmd clone --resurse-submodules "$@"
}

######################################################################
#<
#
# Function: p6_git_p6_revert(...)
#
#  Args:
#	... -
#
#>
######################################################################
p6_git_p6_revert() {
    shift 0

    p6_git_cmd revert "$@"
}

######################################################################
#<
#
# Function: p6_git_p6_grep_files(...)
#
#  Args:
#	... -
#
#>
######################################################################
p6_git_p6_grep_files() {
    shift 0

    p6_git_cmd grep --files-with-match "$@"
}

######################################################################
#<
#
# Function: p6_git_p6_grep(...)
#
#  Args:
#	... -
#
#>
######################################################################
p6_git_p6_grep() {
    shift 0

    p6_git_cmd grep --word-regexp "$@"
}

######################################################################
#<
#
# Function: p6_git_p6_update()
#
#>
######################################################################
p6_git_p6_update() {

    local base
    base=$(p6_git_branch_base_get)

    p6_git_p6_fetch
    p6_git_p6_merge "upstream/$base" "origin/$base"
    p6_git_p6_sync
}
