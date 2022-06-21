FROM alpine/git:1.0.7

LABEL com.github.actions.name="FIXME check"
LABEL com.github.actions.description="Check code for specific terms (FIXME, WIP, etc.) and fail (with code annotations) if any are found."
LABEL com.github.actions.icon="code"
LABEL com.github.actions.color="yellow"

COPY lib/entrypoint.sh /entrypoint.sh
COPY lib/git-grep-problem-matcher.json /git-grep-problem-matcher.json
ENTRYPOINT ["/entrypoint.sh"]
