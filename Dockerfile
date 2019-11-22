FROM alpine/git:1.0.7

LABEL com.github.actions.name="FIXME check"
LABEL com.github.actions.description="Check your code for `FIXME` labels"
LABEL com.github.actions.icon="code"
LABEL com.github.actions.color="yellow"

ENTRYPOINT ["lib/entrypoint.sh"]
