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


### p6git/lib:

#### p6git/lib/cli.sh:

- code rc = p6_git_cmd(cmd, ...)
- p6_git_p6_add(...)
- p6_git_p6_add_all()
- p6_git_p6_branch(...)
- p6_git_p6_branch_create(...)
- p6_git_p6_checkout(...)
- p6_git_p6_checkout_default()
- p6_git_p6_clean(...)
- p6_git_p6_clone(...)
- p6_git_p6_commit(msg)
- p6_git_p6_commit_last_edit(...)
- p6_git_p6_diff(...)
- p6_git_p6_diff_default(...)
- p6_git_p6_diff_head(...)
- p6_git_p6_diff_previous(...)
- p6_git_p6_fetch(...)
- p6_git_p6_git_reset_head_hard()
- p6_git_p6_grep(...)
- p6_git_p6_grep_files(...)
- p6_git_p6_log(...)
- p6_git_p6_merge(...)
- p6_git_p6_pull()
- p6_git_p6_push(...)
- p6_git_p6_push_f()
- p6_git_p6_push_tags(...)
- p6_git_p6_rebase(...)
- p6_git_p6_rebase_abort()
- p6_git_p6_rebase_continue()
- p6_git_p6_remote()
- p6_git_p6_reset(...)
- p6_git_p6_reset_head_ago_one(...)
- p6_git_p6_reset_head_hard(...)
- p6_git_p6_restore(...)
- p6_git_p6_revert(...)
- p6_git_p6_stash_list()
- p6_git_p6_status(...)
- p6_git_p6_sync()
- p6_git_p6_update()
- str symbol = p6_git_p6_symbolic_ref(ref)

#### p6git/lib/util.sh:

- code rc = p6_git_dirty_get()
- code rc = p6_git_inside_tree()
- p6_git_clobber()
- str branch = p6_git_branch_base_get()
- str branch = p6_git_branch_get()
- str org = p6_git_org_org_get()
- str repo = p6_git_org_repo_get()
- str sha = p6_git_sha_short_get()



## Hier
```text
.
├── cli.sh
└── util.sh

0 directories, 2 files
```
## Author

Philip M . Gollucci <pgollucci@p6m7g8.com>
