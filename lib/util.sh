######################################################################
#<
#
# Function: str repo = p6_git_util_repo_from_origin()
#
#  Returns:
#	str - repo
#
#>
######################################################################
p6_git_util_repo_from_origin() {

    local url=$(git remote get-url origin 2>&1)
    local repo=${${url##*/}%.git}

    p6_return_str "$repo"
}

######################################################################
#<
#
# Function: str org = p6_git_util_org_from_origin()
#
#  Returns:
#	str - org
#
#>
######################################################################
p6_git_util_org_from_origin() {

    local url=$(git remote get-url origin 2>&1)
    local org=${${url%/*}##*/}

    p6_return_str "$org"
}

######################################################################
#<
#
# Function: str sha = p6_git_util_sha_short_get()
#
#  Returns:
#	str - sha
#
#  Environment:	 HEAD
#>
######################################################################
p6_git_util_sha_short_get() {

    local sha=$(git rev-parse --short HEAD 2>/dev/null)

    p6_return_str "$sha"
}

######################################################################
#<
#
# Function: code rc = p6_git_util_dirty_get()
#
#  Returns:
#	code - rc
#
#>
######################################################################
p6_git_util_dirty_get() {

    local gstatus="$(git status 2>/dev/null | tail -1)"

    p6_string_blank "$gstatus"
    local rc=$?

    p6_return_code_as_code "$rc"
}

######################################################################
#<
#
# Function: code rc = p6_git_util_inside_tree()
#
#  Returns:
#	code - rc
#
#>
######################################################################
p6_git_util_inside_tree() {

    git rev-parse --is-inside-git-dir > /dev/null 2>&1
    local rc=$?

    p6_return_code_as_code "$rc"
}

######################################################################
#<
#
# Function: p6_git_util_clobber()
#
#>
######################################################################
p6_git_util_clobber() {

  local branch
  branch=$(p6_git_branch_get)

  p6_git_cli_checkout "scratch"
  p6_git_cli_checkout "$branch"
  p6_git_cli_fetch_all
  p6_git_cli_reset "--hard" "origin/$branch"
  p6_git_cli_clean_fdx

  p6_return_void
}

######################################################################
#<
#
# Function: p6_git_util_sync()
#
#>
######################################################################
p6_git_util_sync() {

    p6_git_cli_pull_rebase_autostash_ff_only &&
        p6_git_cli_push_tags
}

######################################################################
#<
#
# Function: p6_git_util_update()
#
#>
######################################################################
p6_git_util_update() {

    local base
    base=$(p6_git_branch_base_get)

    p6_git_cli_fetch_all
    p6_git_cli_merge "upstream/$base" "origin/$base"
    p6_git_util_sync
}

######################################################################
#<
#
# Function: p6_git_util_checkout_default()
#
#>
######################################################################
p6_git_util_checkout_default() {

    local branch
    branch=$(p6_git_branch_base_get)

    p6_git_cli_checkout "$branch"
}

######################################################################
#<
#
# Function: p6_git_util_diff_default(...)
#
#  Args:
#	... - 
#
#>
######################################################################
p6_git_util_diff_default() {
    shift 0

    local branch
    branch=$(p6_git_branch_base_get)

    p6_git_cli_diff "$branch" "$@"
}

######################################################################
#<
#
# Function: p6_git_util_log(...)
#
#  Args:
#	... - 
#
#  Environment:	 DETACHED
#>
######################################################################
p6_git_util_log() {
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
    elif p6_string_eq "development" "$branch"; then
        count=-10
    elif p6_string_eq "next" "$branch"; then
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
# Function: str symbol = p6_git_util_symbolic_ref(ref)
#
#  Args:
#	ref -
#
#  Returns:
#	str - symbol
#
#>
######################################################################
p6_git_util_symbolic_ref() {
    local ref="$1"

    local symbol
    symbol=$(git symbolic-ref "$ref" 2>/dev/null)

    symbol=$(p6_echo "$symbol" | sed -e 's,.*/,,')

    p6_return_str "$symbol"
}
