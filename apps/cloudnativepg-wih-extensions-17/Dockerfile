# syntax=docker/dockerfile:1

ARG VERSION

FROM ghcr.io/cloudnative-pg/postgresql:${VERSION}

USER root

RUN set -xe; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        "postgresql-17-cron" ; \
    rm -fr /tmp/* ; \
    rm -rf /var/lib/apt/lists/*; \
    apt-get clean ; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ;

USER 26
