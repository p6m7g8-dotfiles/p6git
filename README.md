# P6's POSIX.2: p6git

## Table of Contents

- [Badges](#badges)
- [Summary](#summary)
- [Contributing](#contributing)
- [Code of Conduct](#code-of-conduct)
- [Usage](#usage)
  - [Hooks](#hooks)
  - [Functions](#functions)
- [Hierarchy](#hierarchy)
- [Author](#author)

## Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)

## Summary

TODO: Add a short summary of this module.

## Contributing

- [How to Contribute](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CONTRIBUTING.md>)

## Code of Conduct

- [Code of Conduct](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CODE_OF_CONDUCT.md>)

## Usage

### Hooks

- `deps` -> `p6df::modules::p6git::deps()`
- `init` -> `p6df::modules::p6git::init(_module, dir)`

### Functions

#### cli

##### p6git/lib/cli/add.sh

- `p6_git_cli_add(...)`
  - Args:
    - ... - 
- `p6_git_cli_add_all()`

##### p6git/lib/cli/branch.sh

- `p6_git_cli_branch_Delete(...)`
  - Args:
    - ... - 
- `p6_git_cli_branch_create(...)`
  - Args:
    - ... - 
- `p6_git_cli_branch_verbose_verbose(...)`
  - Args:
    - ... - 

##### p6git/lib/cli/checkout.sh

- `p6_git_cli_checkout(...)`
  - Args:
    - ... - 
- `p6_git_cli_checkout_default()`

##### p6git/lib/cli/clean.sh

- `p6_git_cli_clean_fdx(...)`
  - Args:
    - ... - 

##### p6git/lib/cli/clone.sh

- `p6_git_cli_clone(...)`
  - Args:
    - ... - 

##### p6git/lib/cli/commit.sh

- `p6_git_cli_commit_last_edit(...)`
  - Args:
    - ... - 
- `p6_git_cli_commit_squash(...)`
  - Args:
    - ... - 
- `p6_git_cli_commit_verbose(...)`
  - Args:
    - ... - 
- `p6_git_cli_commit_with_message(msg, ...)`
  - Args:
    - msg - 
    - ... - 

##### p6git/lib/cli/diff.sh

- `p6_git_cli_diff(...)`
  - Args:
    - ... - 
- `p6_git_cli_diff_head(...)`
  - Args:
    - ... - 
- `p6_git_cli_diff_previous(...)`
  - Args:
    - ... - 

##### p6git/lib/cli/fetch.sh

- `p6_git_cli_fetch_all(...)`
  - Args:
    - ... - 

##### p6git/lib/cli/grep.sh

- `p6_git_cli_grep(...)`
  - Args:
    - ... - 
- `p6_git_cli_grep_files(...)`
  - Args:
    - ... - 

##### p6git/lib/cli/init.sh

- `p6_git_cli_init(...)`
  - Args:
    - ... - 

##### p6git/lib/cli/log.sh

- `p6_git_cli_log_shas(file)`
  - Args:
    - file - 
- `p6_git_cli_log_since(since, [fmt=format:%h %ci %al %d %s])`
  - Args:
    - since - 
    - OPTIONAL fmt - [format:%h %ci %al %d %s]

##### p6git/lib/cli/merge.sh

- `p6_git_cli_merge(...)`
  - Args:
    - ... - 

##### p6git/lib/cli/pull.sh

- `p6_git_cli_pull_rebase_autostash_ff_only()`

##### p6git/lib/cli/push.sh

- `p6_git_cli_push_fu()`
- `p6_git_cli_push_tags(...)`
  - Args:
    - ... - 
- `p6_git_cli_push_u(...)`
  - Args:
    - ... - 

##### p6git/lib/cli/rebase.sh

- `p6_git_cli_rebase(...)`
  - Args:
    - ... - 
- `p6_git_cli_rebase_abort()`
- `p6_git_cli_rebase_continue()`

##### p6git/lib/cli/remote.sh

- `p6_git_cli_remote_verbose(...)`
  - Args:
    - ... - 

##### p6git/lib/cli/reset.sh

- `p6_git_cli_reset_hard_head(...)`
  - Args:
    - ... - 
- `p6_git_cli_reset_head_ago_one(...)`
  - Args:
    - ... - 
- `p6_git_cli_reset_soft_head(n)`
  - Args:
    - n - 

##### p6git/lib/cli/restore.sh

- `p6_git_cli_restore_stagged(...)`
  - Args:
    - ... - 

##### p6git/lib/cli/revert.sh

- `p6_git_cli_revert(...)`
  - Args:
    - ... - 

##### p6git/lib/cli/stash.sh

- `p6_git_cli_stash_list()`

##### p6git/lib/cli/status.sh

- `p6_git_cli_status_s(...)`
  - Args:
    - ... - 

#### p6git

##### p6git/init.zsh

- `p6df::modules::p6git::deps()`
- `p6df::modules::p6git::init(_module, dir)`
  - Args:
    - _module - 
    - dir - 

#### p6git/lib

##### p6git/lib/branch.sh

- `p6_git_branch_process(branch_tmpl, user, msg, pr_num)`
  - Args:
    - branch_tmpl - 
    - user - 
    - msg - 
    - pr_num - 
- `str branch = p6_git_branch_base_get()`
- `str branch = p6_git_branch_flast_get()`
- `str branch = p6_git_branch_get()`
- `str branch = p6_git_branch_template_render(branch_tmpl, user, pr_num, rest, kind)`
  - Args:
    - branch_tmpl - 
    - user - 
    - pr_num - 
    - rest - 
    - kind - 
- `str branch_tmpl = p6_git_branch_p6_get()`

##### p6git/lib/cli.sh

- `p6_git_cli(...)`
  - Args:
    - ... - 

##### p6git/lib/util.sh

- `p6_git_util_checkout_default()`
- `p6_git_util_clobber()`
- `p6_git_util_commit_push_fix()`
- `p6_git_util_commit_push_squashed_fix()`
- `p6_git_util_diff_default(...)`
  - Args:
    - ... - 
- `p6_git_util_dirty_get()`
- `p6_git_util_inside_tree()`
- `p6_git_util_log(...)`
  - Args:
    - ... - 
- `p6_git_util_shas_for_string(file, search_string)`
  - Args:
    - file - 
    - search_string - 
- `p6_git_util_sync()`
- `p6_git_util_update()`
- `path scratch_file = p6_git_util_msg_collect(editor, msg)`
  - Args:
    - editor - 
    - msg - 
- `str org = p6_git_util_org_from_origin()`
- `str repo = p6_git_util_repo_from_origin()`
- `str sha = p6_git_util_sha_short_get()`
- `str symbol = p6_git_util_symbolic_ref(ref)`
  - Args:
    - ref - 
- `str symbol = p6_git_util_symbolic_ref_full(ref)`
  - Args:
    - ref - 

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
│   │   ├── init.sh
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
│   ├── cli.sh
│   └── util.sh
├── README.md
└── t
    ├── branch.t
    ├── cli-branch.t
    ├── cli-core.t
    ├── cli-network.t
    ├── cli-remote.t
    ├── cli-reset.t
    ├── cli-stash.t
    ├── init.t
    ├── util-network.t
    └── util.t

4 directories, 36 files
```

## Author

Philip M. Gollucci <pgollucci@p6m7g8.com>
