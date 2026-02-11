FROM docker.io/library/caddy:2.10.2-builder@sha256:7b2ecf805d4ff19b5c937c13434f7d0916cb550575b092cb95b038be838b4f2e AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/porkbun

FROM docker.io/library/caddy:2.10.2@sha256:aa07c7478466e3d6c94a74a02375c3fe57a8332226348bc0c6f594eb08dfdc8a

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
