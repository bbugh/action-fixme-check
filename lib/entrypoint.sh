#!/bin/sh

# With problem matchers in a container, the matcher config MUST be available
# outside the container on the VM so we will just copy it into the workspace.
# See: https://github.com/actions/toolkit/issues/205#issuecomment-557647948
matcher_path=`pwd`/git-grep-problem-matcher.json
cp /git-grep-problem-matcher.json "$matcher_path"

echo "::add-matcher::git-grep-problem-matcher.json"

tag="FIXME"
result=$(git grep --no-color -n -e "${tag}:")

echo "${result}"

if [ -n "${result}" ] && [ "${ENVIRONMENT}" != "test" ]; then
  exit 1
fi
