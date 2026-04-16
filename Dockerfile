FROM docker.io/library/caddy:2.11.2-builder@sha256:ccd4503985eaa4aac67dcc75632ab9e9df5bfb55241c95dcd7654f7e986883d4 AS builder

RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    xcaddy build \
    --with github.com/caddy-dns/porkbun

FROM docker.io/library/caddy:2.11.2@sha256:22e1d921a7dd98ea722ebd6819de785fd71abdab7f7fed8a2378e96d29bb923a

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
