FROM php:7-cli-alpine

ARG RELEASE_VERSION=latest

# Metadata params
ARG VCS_REF
ARG BUILD_DATE

ADD https://phar.phpunit.de/phpunit.phar /bin/phpunit
RUN chmod +x /bin/phpunit && /bin/phpunit --version

COPY entrypoint.sh /entrypoint.sh

# Metadata
LABEL org.label-schema.vendor="Sudo-Bot" \
    org.label-schema.url="https://github.com/sudo-bot/docker-phpunit#readme" \
    org.label-schema.name="docker-phpunit" \
    org.label-schema.description="A phpunit image" \
    org.label-schema.version=${RELEASE_VERSION} \
    org.label-schema.vcs-url="https://github.com/sudo-bot/docker-phpunit.git" \
    org.label-schema.vcs-ref=${VCS_REF} \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.docker.schema-version="1.0" \
    \
    com.docker.extension.publisher-url="https://github.com/sudo-bot" \
    \
    org.opencontainers.image.title="Docker phpunit server" \
    org.opencontainers.image.authors="williamdes@wdes.fr" \
    org.opencontainers.image.url="https://github.com/sudo-bot/docker-phpunit#readme" \
    org.opencontainers.image.documentation="https://github.com/sudo-bot/docker-phpunit#readme" \
    org.opencontainers.image.source="https://github.com/sudo-bot/docker-phpunit" \
    org.opencontainers.image.vendor="Sudo-Bot" \
    org.opencontainers.image.licenses="MPL-2.0" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.version=${RELEASE_VERSION} \
    org.opencontainers.image.revision=${VCS_REF} \
    org.opencontainers.image.ref.name="${RELEASE_VERSION}"

ENTRYPOINT ["/entrypoint.sh"]

