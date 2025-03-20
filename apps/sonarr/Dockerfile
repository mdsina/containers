# syntax=docker/dockerfile:1

FROM docker.io/library/alpine:3.21
ARG TARGETARCH
ARG VENDOR
ARG VERSION

ENV UMASK="0002" \
    TZ="Etc/UTC"

ENV DOTNET_EnableDiagnostics=0 \
    SONARR__UPDATE__BRANCH=develop

USER root
WORKDIR /app

RUN \
    apk add --no-cache \
        bash \
        ca-certificates \
        catatonit \
        coreutils \
        curl \
        icu-libs \
        jq \
        libintl \
        nano \
        sqlite-libs \
        tzdata \
    && mkdir -p /app/bin \
    && curl -fsSL "https://github.com/mdsina/Sonarr/releases/download/v${VERSION}/Sonarr.fork-custom.${VERSION}.linux-musl-${TARGETARCH/amd64/x64}.tar.gz" \
        | tar xzf - -C /app/bin --strip-components=1 \
    && printf "UpdateMethod=docker\nBranch=%s\nPackageVersion=%s\nPackageAuthor=[mdsina](https://github.com/mdsina)\n" "${SONARR__UPDATE__BRANCH}" "${VERSION}" > /app/package_info \
    && chown -R root:root /app && chmod -R 755 /app \
    && rm -rf /tmp/* /app/bin/Sonarr.Update

COPY . /

USER nobody:nogroup
WORKDIR /config
VOLUME ["/config"]

ENTRYPOINT ["/usr/bin/catatonit", "--", "/entrypoint.sh"]
