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
# Function: str branch = p6_git_branch_process(branch_tmpl, user, msg, pr_num)
#
#  Args:
#	branch_tmpl -
#	user -
#	msg -
#	pr_num -
#
#  Returns:
#	str - branch
#
#>
######################################################################
p6_git_branch_process() {
  local branch_tmpl="$1"
  local user="$2"
  local msg="$3"
  local pr_num="$4"

  local kind
  kind=$(p6_echo "$msg" | cut -d : -f 1 | sed -e 's,(,/,g' -e 's,),/,g' -e 's,/$,,' -e 's,\/\!,!,')

  local rest
  rest=$(p6_echo "$msg" | cut -d : -f 2- | sed -e 's,^ *,,' -e 's, ,_,g')
  rest=$(p6_string_replace "$rest" "[^A-Za-z0-9_#]" "")

  local branch=$branch_tmpl

  branch=$(p6_string_replace "$branch" "USER" "$user")
  branch=$(p6_string_replace "$branch" "PRN" "$pr_num")
  branch=$(p6_string_replace "$branch" "REST" "$rest")
  branch=$(p6_string_replace "$branch" "KIND" "$kind")
  branch=$(p6_string_replace "$branch" "//" "/")

  p6_return_str "$branch"
}
