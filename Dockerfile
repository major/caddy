FROM docker.io/library/caddy:2.10.0-builder@sha256:c1e0d8e7fe650596356c46319c8c47890045bf3cd4c3d2fc6463a7ff541a99c8 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/porkbun

FROM docker.io/library/caddy:2.10.0@sha256:c589adee755f51a2c52052d6d424aba7b8cee44ebf57070035f0961c22c053f3

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
