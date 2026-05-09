FROM docker.io/library/caddy:2.11.2-builder@sha256:1ecefa333507828a592aaecc68d5f62a993787057429c04e9b0438a65c980a30 AS builder

RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    xcaddy build \
    --with github.com/caddy-dns/porkbun

FROM docker.io/library/caddy:2.11.2@sha256:25cdc846626b62d05f6b633b9b40c2c9f6ef89b515dc76133cefd920f7dbe562

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
