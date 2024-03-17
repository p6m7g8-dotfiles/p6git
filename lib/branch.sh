######################################################################
#<
#
# Function: str branch = p6_git_branch_get()
#
#  Returns:
#	str - branch
#
#  Environment:	 HEAD
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
#  Environment:	 HEAD
#>
######################################################################
p6_git_branch_base_get() {

  local branch
  branch=$(p6_git_util_symbolic_ref "refs/remotes/origin/HEAD")

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
#  Environment:	 USER
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
#  Environment:	 USER
#>
######################################################################
p6_git_branch_flast_get() {

  local branch="USER-PRN-REST"

  p6_return_str "$branch"
}

######################################################################
#<
#
# Function: str branch = p6_git_branch_process(branch_tmpl, user, pr_num, msg)
#
#  Args:
#	branch_tmpl -
#	user -
#	pr_num -
#	msg -
#
#  Returns:
#	str - branch
#
#  Environment:	 KIND PREFIX PRN REST SUFFIX USER
#>
######################################################################
p6_git_branch_process() {
  local branch_tmpl="$1"
  local user="$2"
  local pr_num="$3"
  local msg="$4"

  local kind
  kind=$(p6_echo "$msg" | cut -d : -f 1 | sed -e 's,(,/,g' -e 's,),/,g' -e 's,/$,,' -e 's,\/\!,!,')

  local rest
  rest=$(p6_echo "$msg" | cut -d : -f 2- | sed -e 's,^ *,,' -e 's, ,_,g')
  rest=$(p6_string_replace "$rest" "[^A-Za-z0-9_#]" "")

  local branch=$branch_tmpl

  branch=$(p6_string_replace "$branch" "USER" "$user")
  branch=$(p6_string_replace "$branch" "PRN"  "$prn")
  branch=$(p6_string_replace "$branch" "REST" "$rest")
  branch=$(p6_string_replace "$branch" "KIND" "$kind")

  p6_return_str "$branch"
}
