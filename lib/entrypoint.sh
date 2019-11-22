#!/bin/sh

set -e

echo "::add-matcher::lib/git-grep-problem-matcher.json"

tag="FIXME"
result=$(git grep --no-color -n -e "${tag}:")

echo "${result}"

if [ -n "${result}" ] && [ "${ENVIRONMENT}" != "test" ]; then
  exit 1
fi
