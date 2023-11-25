#!/bin/sh

# With problem matchers in a container, the matcher config MUST be available
# outside the container on the VM so we will just copy it into the workspace.
# See: https://github.com/actions/toolkit/issues/205#issuecomment-557647948
matcher_path=`pwd`/git-grep-problem-matcher.json
cp /git-grep-problem-matcher.json "$matcher_path"

echo "::add-matcher::git-grep-problem-matcher.json"


case_sensitive="${1}"
pathspec="${2}"

if [ ${case_sensitive} = false ]; then
	case_sensitive="--ignore-case"
else
	unset case_sensitive
fi


tag=${INPUT_TERMS:=FIXME}
result=$(git grep --no-color ${case_sensitive} --line-number --extended-regexp -e "(${tag})+(:)" -- ":^.github" "${pathspec}")

echo "${result}"

if [ -n "${result}" ] && [ "${ENVIRONMENT}" != "test" ]; then
  exit 1
fi
