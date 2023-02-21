# syntax=docker/dockerfile:1
# https://phpunit.de/supported-versions.html
# PHPUnit 10 >= PHP 8.1
# PHPUnit 9 >= PHP 7.3
# PHPUnit 8	>= PHP 7.2
# PHPUnit 7	PHP 7.1 - PHP 7.3
FROM php:8.1-cli-alpine

ARG RELEASE_VERSION=latest

# Metadata params
ARG VCS_REF
ARG BUILD_DATE
ARG DIST_URL="https://phar.phpunit.de/phpunit.phar"

ADD $DIST_URL /usr/bin/phpunit
RUN chmod +x /usr/bin/phpunit && phpunit --version

COPY <<-EOT /usr/local/share/sbom/phpunit.spdx.json
{
    "spdxVersion": "SPDX-2.3",
    "dataLicense": "CC0-1.0",
    "SPDXID": "SPDXRef-DOCUMENT",
    "name": "docker-phpunit",
    "packages": [
        {
            "name": "phpunit",
            "SPDXID": "SPDXRef-Package-phpunit",
            "versionInfo": "${VERSION}",
            "originator": "Person: Sebastian Bergmann",
            "downloadLocation": "${DIST_URL}",
            "sourceInfo": "dowloaded from phpunit.de phars",
            "licenseConcluded": "BSD-3-Clause",
            "licenseDeclared": "BSD-3-Clause",
            "copyrightText": "NOASSERTION",
            "description": "phpunit"
        }
    ],
    "externalRefs": [
        {
            "referenceCategory": "SECURITY",
            "referenceLocator": "cpe:2.3:a:phpunit_project:phpunit",
            "referenceType": "cpe23Type"
        },
        {
            "referenceCategory": "SECURITY",
            "referenceLocator": "cpe:/a:phpunit_project:phpunit",
            "referenceType": "cpe22Type"
        },
        {
            "referenceCategory": "PACKAGE_MANAGER",
            "referenceLocator": "pkg:deb/debian/phpunit",
            "referenceType": "purl"
        }
    ]
}
EOT

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
    org.opencontainers.image.title="Docker phpunit" \
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

