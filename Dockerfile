FROM docker.io/library/caddy:2.10.2-builder@sha256:22ff419120e17d257b9744216ecae0b2305d81ff570490fba03625f047c4195a AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/porkbun

FROM docker.io/library/caddy:2.10.2@sha256:4163a5c7b7631707956db4057720ec75de429992d5e3aa518d54872c01644dbe

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
