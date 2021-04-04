# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

### [2.1.2](https://github.com/p6m7g8/p6git/compare/v2.1.1...v2.1.2) (2021-04-04)


### Features

* **api:** master -> default ([#37](https://github.com/p6m7g8/p6git/issues/37)) ([8c64c6d](https://github.com/p6m7g8/p6git/commit/8c64c6df8dfb81b0f1375c7bdd55f4e82cd68048))


* **README:** updates generator ([#38](https://github.com/p6m7g8/p6git/issues/38)) ([8a39090](https://github.com/p6m7g8/p6git/commit/8a390900005256b7241156454786ca71a80b69ee))
* Coc -> .github ([10c105d](https://github.com/p6m7g8/p6git/commit/10c105d8e395b51e8f3eb22f75cbf77e5b5435ac))

### [2.1.1](https://github.com/p6m7g8/p6git/compare/v2.1.0...v2.1.1) (2020-12-23)


### Features

* **api:** 4 funcs ([#36](https://github.com/p6m7g8/p6git/issues/36)) ([78396b9](https://github.com/p6m7g8/p6git/commit/78396b912046181b8d86f7b59f8341afa94ff60d))

## [2.1.0](https://github.com/p6m7g8/p6git/compare/v2.0.0...v2.1.0) (2020-12-06)


### Features

* **api:** adds several new convience functions for aliases ([#25](https://github.com/p6m7g8/p6git/issues/25)) ([d69d5d9](https://github.com/p6m7g8/p6git/commit/d69d5d96549a1571a8b979192acb4e972298f6bb))
* **api:** begin master->main, +`p6_git_base_branch` ([#35](https://github.com/p6m7g8/p6git/issues/35)) ([9848f2d](https://github.com/p6m7g8/p6git/commit/9848f2d3da284a85e0aae78c5d39da68741d8326))
* **api:** centralize ::version() ([9d95acc](https://github.com/p6m7g8/p6git/commit/9d95acc53a37288c2a803b5c6657ca089751cb24))
* **cli:** +`p6_git_p6_update` ([#23](https://github.com/p6m7g8/p6git/issues/23)) ([c8a23a6](https://github.com/p6m7g8/p6git/commit/c8a23a61f7b68be0a2f56675536325065ad218ed))
* **community:** adds CODE_OF_CONDUCT ([cf60998](https://github.com/p6m7g8/p6git/commit/cf60998c5b3a9d072df786d8c15b5948c37b9aba))
* **github:** adds ISSUE_TEMPLATEs ([5c13b5d](https://github.com/p6m7g8/p6git/commit/5c13b5de67faa85097678403f9dd6efaac73e52d))


### Bug Fixes

* **api:** fix duplicate function name ([#34](https://github.com/p6m7g8/p6git/issues/34)) ([3bfb14a](https://github.com/p6m7g8/p6git/commit/3bfb14a409b685deddf0da3b4c1675b1566e7f11))
* **diff:** fixes typos in function names ([#28](https://github.com/p6m7g8/p6git/issues/28)) ([47f9282](https://github.com/p6m7g8/p6git/commit/47f9282c9b980d44e5ad7e7e021eabf097010feb))


* **community:** rely on the .github/ in the org ([#32](https://github.com/p6m7g8/p6git/issues/32)) ([847463b](https://github.com/p6m7g8/p6git/commit/847463b50765763088314a599410b6ab001c0fd2))
* **docs:** fixes whitespace ([0e6bc86](https://github.com/p6m7g8/p6git/commit/0e6bc86187f1028fd3c7173aea31017888fde1b5))
* **README:** fixes module expansion, adds CodeCov and Synk badges ([#33](https://github.com/p6m7g8/p6git/issues/33)) ([320a604](https://github.com/p6m7g8/p6git/commit/320a6042fec15d778cafaff44ff4083807e6a3d1))
* **README:** updates to template v2.0 ([fd1e4af](https://github.com/p6m7g8/p6git/commit/fd1e4afa46bb520a957d9cd78d4b3b4e728dfc62))
* **semantic:** no longer needed, defaults are fine ([dfbbfd6](https://github.com/p6m7g8/p6git/commit/dfbbfd6beae3f8befcc714cdbe6aa919f41e8ab7))

## [2.0.0](https://github.com/p6m7g8/p6git/compare/v1.0.7...v2.0.0) (2020-10-11)


### Features

* **p6_git_p6_log:** supports DETACHED HEAD wc ([#21](https://github.com/p6m7g8/p6git/issues/21)) ([bd90f89](https://github.com/p6m7g8/p6git/commit/bd90f89a04157a0ad2f8e22687c6f27f0422c01e))


### Bug Fixes

* **deps:** depends on `p6m7g8/p6common`, drop --porcelain, simplify _cmd() ([#22](https://github.com/p6m7g8/p6git/issues/22)) ([cf25e35](https://github.com/p6m7g8/p6git/commit/cf25e353b0675fca57e36d9b3ac073d7e403e373))
* **p6_git_branch_get:** works in detached head state ([#20](https://github.com/p6m7g8/p6git/issues/20)) ([03de640](https://github.com/p6m7g8/p6git/commit/03de64074b766b0f9c67ab4e93aeddf9407e5569))

### [1.0.7](https://github.com/p6m7g8/p6git/compare/v1.0.6...v1.0.7) (2020-09-20)


### Features

* **cli:** + p6_git_p6_restore() ([cc6ee78](https://github.com/p6m7g8/p6git/commit/cc6ee78cfd9390ab80b2938c898b01f5827cf116))
* **cli:** +p6_git_p6_add_all(), p6_git_p6_diff_head(), p6_git_p6_push_tags, p6_git_p6_push_tags() ([#19](https://github.com/p6m7g8/p6git/issues/19)) ([cf23391](https://github.com/p6m7g8/p6git/commit/cf233913c9ea2f27e440d96a8c04f712a00ff2da))

### [1.0.6](https://github.com/p6m7g8/p6git/compare/v1.0.5...v1.0.6) (2020-06-04)


### Features

* **cli:** +p6_git_p6_checkout_master ([#18](https://github.com/p6m7g8/p6git/issues/18)) ([9ecad31](https://github.com/p6m7g8/p6git/commit/9ecad31a2817d7cd803fc6600e78904305c3084e))
* **sync:** fixes function typos ([#17](https://github.com/p6m7g8/p6git/issues/17)) ([a20e9ba](https://github.com/p6m7g8/p6git/commit/a20e9badabf9eb6aa41881f5d7efd93d2171b665))

### [1.0.5](https://github.com/p6m7g8/p6git/compare/v1.0.4...v1.0.5) (2020-06-02)


### Features

* **api:** adds _add(), _remote() funcs ([#16](https://github.com/p6m7g8/p6git/issues/16)) ([411b954](https://github.com/p6m7g8/p6git/commit/411b95488acbe075a8b2d25e7f556f1e5a381b16))
* **log:** shows branch logs or just last 10 on master ([#15](https://github.com/p6m7g8/p6git/issues/15)) ([4d695fd](https://github.com/p6m7g8/p6git/commit/4d695fd9d06f4a2968cad336580ffe2747f66059))

### [1.0.4](https://github.com/p6m7g8/p6git/compare/v1.0.3...v1.0.4) (2020-06-02)


### Features

* **cli:** converts .gitconfig[aliases] -> p6 funcs ([#13](https://github.com/p6m7g8/p6git/issues/13)) ([cc778a3](https://github.com/p6m7g8/p6git/commit/cc778a35341de7e0e54e72f21ba8d4318ae9a58c))

### [1.0.3](https://github.com/p6m7g8/p6git/compare/v1.0.2...v1.0.3) (2020-06-02)


### Features

* **cicd:** setups semantic-version ([#9](https://github.com/p6m7g8/p6git/issues/9)) ([8713047](https://github.com/p6m7g8/p6git/commit/8713047c28379d241e6c4d24671d8e871d43bfb6))
* **cli:** adds p6_git_cmd() and uses internally ([#10](https://github.com/p6m7g8/p6git/issues/10)) ([486c89d](https://github.com/p6m7g8/p6git/commit/486c89de7a0b0953b83d67a9fc8bff3099315b5c))
* **util:** uses p6_git_cmd() ([#11](https://github.com/p6m7g8/p6git/issues/11)) ([3750e90](https://github.com/p6m7g8/p6git/commit/3750e901f341deb76cadeaedde3b2d19825f2ae7))

### [1.0.2](https://github.com/p6m7g8/p6git/compare/v1.0.1...v1.0.2) (2020-05-29)

### 1.0.1 (2020-05-29)


### Features

* **api:** p6_git_submit moved to p6github/p6_github_cli_submit() ([e06f259](https://github.com/p6m7g8/p6git/commit/e06f259a93adfbad5e0a46d045d7d2c7515e5476))
* **cicd:** setups Makefile and standard-version ([#7](https://github.com/p6m7g8/p6git/issues/7)) ([6123b8a](https://github.com/p6m7g8/p6git/commit/6123b8a56a4ddbe1f5af3daa54701fd3f8ba2031))


* **doc:** updates doc_inline.pl@current ([2737b8c](https://github.com/p6m7g8/p6git/commit/2737b8cc5f60a5d3199786016bf15e6c5a1de4a2))
* **doc:** updates doc_inline.pl@current ([#2](https://github.com/p6m7g8/p6git/issues/2)) ([01fef50](https://github.com/p6m7g8/p6git/commit/01fef50974e58b7fe9370cb7371fa0ec911b2cf5))
* **docs:** regen ([#4](https://github.com/p6m7g8/p6git/issues/4)) ([b62d5a0](https://github.com/p6m7g8/p6git/commit/b62d5a0022b2699fc05db838a2473e9a618ff666))
* **mergify:** adds config ([e1c804e](https://github.com/p6m7g8/p6git/commit/e1c804e54797d3fccd7f51edba3348c87e76c06e))
* **readme:** regen ([#5](https://github.com/p6m7g8/p6git/issues/5)) ([da535b2](https://github.com/p6m7g8/p6git/commit/da535b2a8a1e13a4f45a27053ba6492f647e45ab))
* **semqntic:** adds semantic.yml ([#1](https://github.com/p6m7g8/p6git/issues/1)) ([a44d3e6](https://github.com/p6m7g8/p6git/commit/a44d3e6995b849a27da60d9511ee4348a6743b78))
