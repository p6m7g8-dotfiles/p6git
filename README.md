# p6git

## Table of Contents


### p6git
- [p6git](#p6git)
  - [Badges](#badges)
  - [Distributions](#distributions)
  - [Summary](#summary)
  - [Contributing](#contributing)
  - [Code of Conduct](#code-of-conduct)
  - [Changes](#changes)
    - [Usage](#usage)
  - [Author](#author)

### Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)
[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/p6m7g8/p6git)
[![Mergify](https://img.shields.io/endpoint.svg?url=https://gh.mergify.io/badges/p6m7g8/p6git/&style=flat)](https://mergify.io)
[![codecov](https://codecov.io/gh/p6m7g8/p6git/branch/master/graph/badge.svg?token=14Yj1fZbew)](https://codecov.io/gh/p6m7g8/p6git)
[![Known Vulnerabilities](https://snyk.io/test/github/p6m7g8/p6git/badge.svg?targetFile=package.json)](https://snyk.io/test/github/p6m7g8/p6git?targetFile=package.json)
[![Gihub repo dependents](https://badgen.net/github/dependents-repo/p6m7g8/p6git)](https://github.com/p6m7g8/p6git/network/dependents?dependent_type=REPOSITORY)
[![Gihub package dependents](https://badgen.net/github/dependents-pkg/p6m7g8/p6git)](https://github.com/p6m7g8/p6git/network/dependents?dependent_type=PACKAGE)

## Summary

## Contributing

- [How to Contribute](CONTRIBUTING.md)

## Code of Conduct

- [Code of Conduct](https://github.com/p6m7g8/.github/blob/master/CODE_OF_CONDUCT.md)

## Changes

- [Change Log](CHANGELOG.md)

## Usage

### p6git:

#### p6git/init.zsh:

- p6df::modules::p6git::deps()
- p6df::modules::p6git::init(_module, dir)


### cli:

#### cli/add.sh:

- p6_git_cli_add()
- p6_git_cli_add_all()

#### cli/branch.sh:

- p6_git_cli_branch_create(...)
- p6_git_cli_branch_verbose_verbose()

#### cli/checkout.sh:

- p6_git_cli_checkout()
- p6_git_cli_checkout_default()

#### cli/clean.sh:

- p6_git_cli_clean_fdx()

#### cli/clone.sh:

- p6_git_cli_clone()

#### cli/commit.sh:

- p6_git_cli_commit_last_edit(...)
- p6_git_cli_commit_verbose_with_message()

#### cli/diff.sh:

- p6_git_cli_diff()
- p6_git_cli_diff_head(...)
- p6_git_cli_diff_previous(...)

#### cli/fetch.sh:

- p6_git_cli_fetch_all(...)

#### cli/grep.sh:

- p6_git_cli_grep(...)
- p6_git_cli_grep_files()

#### cli/merge.sh:

- p6_git_cli_merge()

#### cli/pull.sh:

- p6_git_cli_pull_rebase_autostash_ff_only()

#### cli/push.sh:

- p6_git_cli_push_f()
- p6_git_cli_push_tags(...)
- p6_git_cli_push_u()

#### cli/rebase.sh:

- p6_git_cli_rebase()
- p6_git_cli_rebase_abort()
- p6_git_cli_rebase_continue()

#### cli/remote.sh:

- p6_git_cli_remote_verbose()

#### cli/reset.sh:

- p6_git_cli_reset_head_ago_one(...)
- p6_git_cli_reset_head_hard()

#### cli/restore.sh:

- p6_git_cli_restore_stagged()

#### cli/revert.sh:

- p6_git_cli_revert()

#### cli/stash.sh:

- p6_git_cli_stash_list()

#### cli/status.sh:

- p6_git_cli_status_s(...)


### p6git/lib:

#### p6git/lib/branch.sh:

- str branch = p6_git_branch_base_get()
- str branch = p6_git_branch_flast_get()
- str branch = p6_git_branch_get()
- str branch = p6_git_branch_process(branch_tmpl, user, pr_num, msg)
- str branch_tmpl = p6_git_branch_p6_get()

#### p6git/lib/util.sh:

- code rc = p6_git_util_dirty_get()
- code rc = p6_git_util_inside_tree()
- p6_git_util_checkout_default()
- p6_git_util_clobber()
- p6_git_util_diff_default(...)
- p6_git_util_log(...)
- p6_git_util_sync()
- p6_git_util_update()
- str org = p6_git_util_org_from_origin()
- str repo = p6_git_util_repo_from_origin()
- str sha = p6_git_util_sha_short_get()
- str symbol = p6_git_util_symbolic_ref(ref)



## Hier
```text
.
├── branch.sh
├── cli
│   ├── add.sh
│   ├── branch.sh
│   ├── checkout.sh
│   ├── clean.sh
│   ├── clone.sh
│   ├── commit.sh
│   ├── diff.sh
│   ├── fetch.sh
│   ├── grep.sh
│   ├── merge.sh
│   ├── pull.sh
│   ├── push.sh
│   ├── rebase.sh
│   ├── remote.sh
│   ├── reset.sh
│   ├── restore.sh
│   ├── revert.sh
│   ├── stash.sh
│   └── status.sh
└── util.sh

2 directories, 21 files
```
## Author

Philip M . Gollucci <pgollucci@p6m7g8.com>
