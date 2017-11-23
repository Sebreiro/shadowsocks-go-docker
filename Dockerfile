FROM alpine:3.6

COPY scripts /scripts

RUN set ex && \
    chmod +x /scripts/*

RUN set -ex && \
    /scripts/install-golang.sh && \
    /scripts/install-shadowsocks-go.sh && \
    /scripts/clean-golang.sh && \
    /scripts/clean-apk.sh

VOLUME ["/etc/shadowsocks"]
COPY config.default.json /
COPY entrypoint.sh /

RUN set ex && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]