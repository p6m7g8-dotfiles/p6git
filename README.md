# P6's POSIX.2: p6git

## Table of Contents

## Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)
[![Mergify](https://img.shields.io/endpoint.svg?url=https://gh.mergify.io/badges//p6git/&style=flat)](https://mergify.io)
[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](<https://gitpod.io/#https://github.com//p6git>)

## Summary

## Contributing

- [How to Contribute](<https://github.com//.github/blob/main/CONTRIBUTING.md>)

## Code of Conduct

- [Code of Conduct](<https://github.com//.github/blob/main/CODE_OF_CONDUCT.md>)

## Usage

### Aliases

### Functions

## cli

### p6git/lib/cli/add.sh

- p6_git_cli_add()
- p6_git_cli_add_all()

### p6git/lib/cli/branch.sh

- p6_git_cli_branch_Delete(...)
- p6_git_cli_branch_create(...)
- p6_git_cli_branch_verbose_verbose()

### p6git/lib/cli/checkout.sh

- p6_git_cli_checkout()
- p6_git_cli_checkout_default()

### p6git/lib/cli/clean.sh

- p6_git_cli_clean_fdx()

### p6git/lib/cli/clone.sh

- p6_git_cli_clone()

### p6git/lib/cli/commit.sh

- p6_git_cli_commit_last_edit(...)
- p6_git_cli_commit_squash(...)
- p6_git_cli_commit_verbose(...)
- p6_git_cli_commit_with_message()

### p6git/lib/cli/diff.sh

- p6_git_cli_diff()
- p6_git_cli_diff_head(...)
- p6_git_cli_diff_previous(...)

### p6git/lib/cli/fetch.sh

- p6_git_cli_fetch_all(...)

### p6git/lib/cli/grep.sh

- p6_git_cli_grep(...)
- p6_git_cli_grep_files()

### p6git/lib/cli/log.sh

- p6_git_cli_log_shas(file)
- p6_git_cli_log_since()

### p6git/lib/cli/merge.sh

- p6_git_cli_merge()

### p6git/lib/cli/pull.sh

- p6_git_cli_pull_rebase_autostash_ff_only()

### p6git/lib/cli/push.sh

- p6_git_cli_push_fu()
- p6_git_cli_push_tags(...)
- p6_git_cli_push_u()

### p6git/lib/cli/rebase.sh

- p6_git_cli_rebase()
- p6_git_cli_rebase_abort()
- p6_git_cli_rebase_continue()

### p6git/lib/cli/remote.sh

- p6_git_cli_remote_verbose()

### p6git/lib/cli/reset.sh

- p6_git_cli_reset_hard_head()
- p6_git_cli_reset_head_ago_one(...)
- p6_git_cli_reset_soft_head(n)

### p6git/lib/cli/restore.sh

- p6_git_cli_restore_stagged()

### p6git/lib/cli/revert.sh

- p6_git_cli_revert()

### p6git/lib/cli/stash.sh

- p6_git_cli_stash_list()

### p6git/lib/cli/status.sh

- p6_git_cli_status_s(...)

## p6git

### p6git/init.zsh

- p6df::modules::p6git::deps()
- p6df::modules::p6git::init(_module, dir)

## p6git/lib

### p6git/lib/branch.sh

- str branch = p6_git_branch_base_get()
- str branch = p6_git_branch_flast_get()
- str branch = p6_git_branch_get()
- str branch = p6_git_branch_process(branch_tmpl, user, msg, pr_num)
- str branch_tmpl = p6_git_branch_p6_get()

### p6git/lib/util.sh

- code rc = p6_git_util_dirty_get()
- code rc = p6_git_util_inside_tree()
- p6_git_util_checkout_default()
- p6_git_util_clobber()
- p6_git_util_commit_push_fix()
- p6_git_util_commit_push_squashed_fix()
- p6_git_util_diff_default(...)
- p6_git_util_log(...)
- p6_git_util_shas_for_string(file, search_string)
- p6_git_util_sync()
- p6_git_util_update()
- path scratch_file = p6_git_util_msg_collect(editor, msg)
- str org = p6_git_util_org_from_origin()
- str repo = p6_git_util_repo_from_origin()
- str sha = p6_git_util_sha_short_get()
- str symbol = p6_git_util_symbolic_ref(ref)

## Hierarchy

```text
.
├── init.zsh
├── lib
│   ├── branch.sh
│   ├── cli
│   │   ├── add.sh
│   │   ├── branch.sh
│   │   ├── checkout.sh
│   │   ├── clean.sh
│   │   ├── clone.sh
│   │   ├── commit.sh
│   │   ├── diff.sh
│   │   ├── fetch.sh
│   │   ├── grep.sh
│   │   ├── log.sh
│   │   ├── merge.sh
│   │   ├── pull.sh
│   │   ├── push.sh
│   │   ├── rebase.sh
│   │   ├── remote.sh
│   │   ├── reset.sh
│   │   ├── restore.sh
│   │   ├── revert.sh
│   │   ├── stash.sh
│   │   └── status.sh
│   └── util.sh
└── README.md

3 directories, 24 files
```

## Author

Philip M . Gollucci <pgollucci@p6m7g8.com>
