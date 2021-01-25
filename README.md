# sh-checker

A [GitHub action](https://docs.github.com/en/free-pro-team@latest/actions) that performs static analysis of shell scripts using [shellcheck](https://github.com/koalaman/shellcheck) and [shfmt](https://github.com/mvdan/sh).

![Screen Shot 2020-04-01 at 12 18 59](https://user-images.githubusercontent.com/6004689/78155536-f9a8a080-7413-11ea-8b5c-2c96484feb61.png)


## Usage

Job example to check all sh files but ignore the directory `.terraform` and file `dir/example.sh`

```
name: example
on:
  - pull_request
jobs:
  sh-checker:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - name: Run the sh-checker
        uses: luizm/action-sh-checker@v0.1.12
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          SHELLCHECK_OPTS: -e SC1004 # exclude some shellcheck warnings.
          SHFMT_OPTS: -s # arguments to shfmt.
        with:
          sh_checker_comment: true
          sh_checker_exclude: ".terraform ^dir/example.sh"
```

### Environment Variables

`SHELLCHECK_OPTS`: Used to specify shellcheck arguments.

`SHFMT_OPTS`: Used to specify shfmt arguments.

### Inputs

`sh_checker_exclude`: (optional) Directory or file name that doesn't need to be checked.

`sh_checker_comment`: (optional) If true, it will show the errors as commentaries in the pull requests. Default is false.

`sh_checker_only_diff`: (optional) If true, only files that had been modified will be checked. Default is false.

`sh_checker_shfmt_disable`: (optional) If true, it will skip shfmt. Default is false.

`sh_checker_shellcheck_disable`: (optional) If true, it will skip shellcheck. Default is false.

`sh_checker_checkbashisms_enable`: (optional) If true, run checkbashisms tool against scripts. Default is false.
### Secrets

`GITHUB_TOKEN`: (optional) The GitHub API token used to post comments to pull requests. Not required if `sh_checker_comment` is set to false.
