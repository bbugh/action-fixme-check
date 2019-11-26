# action-fixme-alert

Checks the code base for any `FIXME:` (with the colon) and fails the check if any are found. Useful if you want to make sure that you don't miss any required changes in the code base before merging a PR.

This uses the built-in `git grep` command, and the built-in [action problem
matchers](https://github.com/actions/toolkit/blob/master/docs/problem-matchers.md),
so it's very fast. It only takes a few seconds to run, even on a very large
codebase.

## Installation

Edit or create a workflow `.yml` file in `.github/workflows` folder of your repository.

Here's an example of a `linters.yml` workflow.

```yml
name: Linters

on: [push]

jobs:
  fixmes:
    name: FIXME check
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - uses: bbugh/action-fixme-check@master # or @ the latest release
```

## Support

- [Official workflow configuration docs](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/workflow-syntax-for-github-actions).

## License

The `action-fixme-check` library is available as open source under the terms of
the [MIT License](http://opensource.org/licenses/MIT). This license means you
can use it however you want, as long as you give me credit. Praise and adoration
is optional, but encouraged.
