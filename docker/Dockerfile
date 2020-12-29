FROM php:7-cli-alpine

ARG RELEASE_VERSION=8

# Metadata params
ARG VCS_REF
ARG BUILD_DATE

ADD https://phar.phpunit.de/phpunit-${RELEASE_VERSION}.phar /bin/phpunit
RUN chmod +x /bin/phpunit && /bin/phpunit --version

COPY entrypoint.sh /entrypoint.sh

# Metadata
LABEL org.label-schema.vendor="Sudo-Bot" \
    org.label-schema.url="https://github.com/sebastianbergmann/phpunit#readme" \
    org.label-schema.name="phpunit" \
    org.label-schema.description="A phpunit image" \
    org.label-schema.version=${RELEASE_VERSION} \
    org.label-schema.vcs-url="https://github.com/sebastianbergmann/phpunit.git" \
    org.label-schema.vcs-ref=${VCS_REF} \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.docker.schema-version="1.0"

ENTRYPOINT ["/entrypoint.sh"]

