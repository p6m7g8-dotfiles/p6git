p6_git_cmd() {
    local cmd="$1"
    shift 1

    local log_type
    case $cmd in
        *) log_type=p6_run_write_cmd ;;
    esac    
    
    p6_run_code "$log_type git $cmd $@"
    local rc=$?

    p6_return_code_as_code "$rc";
}

######################################################################
#<
#
# Function: p6_git_init()
#
#>
######################################################################
p6_git_init() {

    p6_run_write_cmd git init "$@"
}

######################################################################
#<
#
# Function: p6_git_checkout()
#
#>
######################################################################
p6_git_checkout() {

    p6_run_write_cmd git checkout "$@"
}

######################################################################
#<
#
# Function: p6_git_reset()
#
#>
######################################################################
p6_git_reset() {

    p6_run_write_cmd git reset "$@"
}

######################################################################
#<
#
# Function: p6_git_commit()
#
#>
######################################################################
p6_git_commit() {

    p6_run_write_cmd git commit "$@"
}

######################################################################
#<
#
# Function: p6_git_add()
#
#>
######################################################################
p6_git_add() {

    p6_run_write_cmd git add "$@"
}

######################################################################
#<
#
# Function: p6_git_status()
#
#>
######################################################################
p6_git_status() {

    p6_run_read_cmd git status "$@"
}

######################################################################
#<
#
# Function: p6_git_push()
#
#>
######################################################################
p6_git_push() {

    p6_run_write_cmd git push "$@"
}

######################################################################
#<
#
# Function: p6_git_pull()
#
#>
######################################################################
p6_git_pull() {

    p6_run_write_cmd git pull "$@"
}

######################################################################
#<
#
# Function: p6_git_remote()
#
#>
######################################################################
p6_git_remote() {

    p6_run_write_cmd git remote "$@"
}

######################################################################
#<
#
# Function: p6_git_symbolic_ref()
#
#>
######################################################################
p6_git_symbolic_ref() {

    p6_run_read_cmd git symbolic-ref "$@"
}

######################################################################
#<
#
# Function: p6_git_rev_parse()
#
#>
######################################################################
p6_git_rev_parse() {

    p6_run_read_cmd git rev-parse "$@"
}