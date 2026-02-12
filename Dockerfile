FROM docker.io/library/caddy:2.10.2-builder@sha256:7b2ecf805d4ff19b5c937c13434f7d0916cb550575b092cb95b038be838b4f2e AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/porkbun

FROM docker.io/library/caddy:2.10.2@sha256:c3d7ee5d2b11f9dc54f947f68a734c84e9c9666c92c88a7f30b9cba5da182adb

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
