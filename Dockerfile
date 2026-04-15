FROM docker.io/library/caddy:2.11.2-builder@sha256:ccd4503985eaa4aac67dcc75632ab9e9df5bfb55241c95dcd7654f7e986883d4 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/porkbun

FROM docker.io/library/caddy:2.11.2@sha256:2acb10cebb92eea91a40b76691aff73adde9151416facbeab630bbc66d0969ab

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
