######################################################################
#<
#
# Function: str branch = p6_git_branch_get()
#
#  Returns:
#	str - branch
#
#>
######################################################################
p6_git_branch_get() {

  local branch

  branch=$(p6_git_p6_symbolic_ref "HEAD")

  p6_return_str "$branch"
}

######################################################################
#<
#
# Function: str branch = p6_git_branch_base_get()
#
#  Returns:
#	str - branch
#
#>
######################################################################
p6_git_branch_base_get() {

  local branch
  branch=$(p6_git_p6_symbolic_ref "refs/remotes/origin/HEAD")

  p6_return_str "$branch"
}

######################################################################
#<
#
# Function: str repo = p6_git_org_repo_get()
#
#  Returns:
#	str - repo
#
#>
######################################################################
p6_git_org_repo_get() {

    local url=$(git remote get-url origin 2>&1)
    local repo=${${url##*/}%.git}

    p6_return_str "$repo"
}

######################################################################
#<
#
# Function: str org = p6_git_org_org_get()
#
#  Returns:
#	str - org
#
#>
######################################################################
p6_git_org_org_get() {

    local url=$(git remote get-url origin 2>&1)
    local org=${${url%/*}##*/}

    p6_return_str "$org"
}

######################################################################
#<
#
# Function: str sha = p6_git_sha_short_get()
#
#  Returns:
#	str - sha
#
#>
######################################################################
p6_git_sha_short_get() {

    local sha=$(git rev-parse --short HEAD 2>/dev/null)

    p6_return_str "$sha"
}

######################################################################
#<
#
# Function: code rc = p6_git_dirty_get()
#
#  Returns:
#	code - rc
#
#>
######################################################################
p6_git_dirty_get() {

    local gstatus="$(git status 2>/dev/null | tail -1)"

    p6_string_blank "$gstatus"
    local rc=$?

    p6_return_code_as_code "$rc"
}

######################################################################
#<
#
# Function: code rc = p6_git_inside_tree()
#
#  Returns:
#	code - rc
#
#>
######################################################################
p6_git_inside_tree() {

    git rev-parse --is-inside-git-dir > /dev/null 2>&1
    local rc=$?

    p6_return_code_as_code "$rc"
}

######################################################################
#<
#
# Function: p6_git_clobber()
#
#>
######################################################################
p6_git_clobber() {

  local branch
  branch=$(p6_git_branch_get)

  p6_git_p6_checkout "scratch"
  p6_git_p6_checkout "$branch"
  p6_git_p6_fetch
  p6_git_p6_reset "--hard" "origin/$branch"
  p6_git_p6_clean

  p6_return_void
}
