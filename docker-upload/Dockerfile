FROM docker:stable

LABEL com.github.actions.name="GitHub Action for Twine"
LABEL com.github.actions.description="Action that allows use of twine"
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="blue"

LABEL version="0.1.0"
LABEL repository="https://github.com/OrangutanGaming/actions"
LABEL homepage="https://github.com/OrangutanGaming/actions"
LABEL maintainer="Nihaal Sangha (Orangutan) <OrangutanGaming@github.com>"

COPY entrypoint.sh /entrypoint.sh
WORKDIR /workspace

ENTRYPOINT ["/entrypoint.sh"]
