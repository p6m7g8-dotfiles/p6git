# shellcheck shell=bash
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
#>
######################################################################
p6_git_util_log() {
    shift 0

    local branch
    local base
    local format="format:%Cred%h%Creset|%Cgreen%ci|%C(bold blue)%al%Creset|%s|%C(yellow)%d%Creset"
    branch=$(p6_git_branch_get)
    base=$(p6_git_branch_base_get)

    case $branch in
    next|development|main|master) 
      local count="-10"
      git log --pretty="$format" "$count" "$@"
      ;;
    *)
      local range="${base}..${branch}"
      git log --pretty="$format" "$range" "$@"
      ;;
   esac

   p6_return_void 
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

######################################################################
#<
#
# Function: path scratch_file = p6_git_util_msg_collect(editor, msg)
#
#  Args:
#	editor -
#	msg -
#
#  Returns:
#	path - scratch_file
#
#>
######################################################################
p6_git_util_msg_collect() {
    local editor="$1"
    local msg="$2"

    # p6_transient
    scratch_file=$(p6_edit_scratch_file_create "$msg")
    local marker="# p6_git_util_msg_collect(): lines below this marker will be ignored"

    # populate file
    p6_echo "" >> "$scratch_file"
    p6_echo "$marker" >> "$scratch_file"
    p6_git_cli_status_s >> "$scratch_file"
    p6_git_cli_diff_head >> "$scratch_file"

    p6_edit_editor_run "$editor" "$scratch_file"

    # sanitize file
    p6_file_marker_delete_to_end "$scratch_file" "$marker"

    p6_return_path "$scratch_file"
}

######################################################################
#<
#
# Function: p6_git_util_shas_for_string(file, search_string)
#
#  Args:
#	file -
#	search_string -
#
#>
######################################################################
p6_git_util_shas_for_string() {
  local file="$1"
  local search_string="$2"

  local previous_sha=""
  local current_sha
  p6_git_cli_log_shas "$file" | while read -r current_sha; do
    if p6_string_blank "$previous_sha"; then
      local diff_output=$(git diff "$current_sha" "$previous_sha" -- "$file")

      if p6_echo "$diff_output" | grep -q "$search_string"; then
        p6_msg "Found '$search_string' in the diff between $current_sha and $previous_sha"
      fi
    fi

    previous_sha=$current_sha
  done

  p6_return_void
}

######################################################################
#<
#
# Function: p6_git_util_commit_push_squashed_fix()
#
#>
######################################################################
p6_git_util_commit_push_squashed_fix() {

    p6_git_cli_status_s
    p6_git_cli_diff
    p6_git_cli_add_all
    p6_git_cli_commit_with_message "squash me"
    p6_git_cli_reset_soft_head "2"
    p6_git_cli_commit_squash
    p6_git_cli_push_fu

    p6_return_void
}

######################################################################
#<
#
# Function: p6_git_util_commit_push_fix()
#
#>
######################################################################
p6_git_util_commit_push_fix() {

    p6_git_cli_status_s
    p6_git_cli_diff
    p6_git_cli_add_all
    p6_git_cli_commit_with_message "fix"
    p6_git_cli_push_u

    p6_return_void
}
