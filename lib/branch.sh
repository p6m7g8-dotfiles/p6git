# shellcheck shell=bash
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

  branch=$(p6_git_util_symbolic_ref "HEAD")

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

  local branches="next development main master"

  local branch
  # shellcheck disable=2116 # zsh
  for branch in $(echo "$branches"); do
    if git show-ref "refs/heads/$branch" >/dev/null 2>&1; then
      break 
    fi
  done

  p6_return_str "$branch"
}

######################################################################
#<
#
# Function: str branch_tmpl = p6_git_branch_p6_get()
#
#  Returns:
#	str - branch_tmpl
#
#>
######################################################################
p6_git_branch_p6_get() {

  local branch_tmpl="USER/KIND/PRN/REST#PREFIXSUFFIX"

  p6_return_str "$branch_tmpl"
}

######################################################################
#<
#
# Function: str branch = p6_git_branch_flast_get()
#
#  Returns:
#	str - branch
#
#>
######################################################################
p6_git_branch_flast_get() {

  local branch="USER-PRN-REST"

  p6_return_str "$branch"
}

######################################################################
#<
#
# Function: str branch = p6_git_branch_template_render(branch_tmpl, user, pr_num, rest, kind)
#
#  Args:
#	branch_tmpl -
#	user -
#	pr_num -
#	rest -
#	kind -
#
#  Returns:
#	str - branch
#
#>
######################################################################
p6_git_branch_template_render() {
  local branch_tmpl="$1"
  local user="$2"
  local pr_num="$3"
  local rest="$4"
  local kind="$5"

  local branch="$branch_tmpl"

  branch="${branch//USER/$user}"
  branch="${branch//PRN/$pr_num}"
  branch="${branch//REST/$rest}"
  branch="${branch//KIND/$kind}"
  branch=$(p6_string_collapse_double_slash "$branch")

  p6_return_str "$branch"
}

######################################################################
#<
#
# Function: p6_git_branch_process(branch_tmpl, user, msg, pr_num)
#
#  Args:
#	branch_tmpl -
#	user -
#	msg -
#	pr_num -
#
#>
######################################################################
p6_git_branch_process() {
  local branch_tmpl="$1"
  local user="$2"
  local msg="$3"
  local pr_num="$4"

  local kind
  kind=$(p6_echo "$msg" | p6_filter_column_pluck 1 ":" | p6_filter_translate_parens_to_slash | p6_filter_strip_trailing_slash | p6_filter_translate_trailing_slash_bang_to_bang)

  local rest
  rest=$(p6_echo "$msg" | p6_filter_column_pluck 2- ":" | p6_filter_strip_leading_spaces | p6_filter_translate_space_to_underscore)
  rest=$(p6_string_strip_non_branch_chars "$rest")

  p6_git_branch_template_render "$branch_tmpl" "$user" "$pr_num" "$rest" "$kind"
}
