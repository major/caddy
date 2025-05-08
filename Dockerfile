FROM docker.io/library/caddy:2.10.0-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/porkbun

FROM docker.io/library/caddy:2.10.0

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
