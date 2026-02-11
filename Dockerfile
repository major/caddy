FROM docker.io/library/caddy:2.10.2-builder@sha256:fbcbf6ec1f6d94bc85be547a4d46ac32d0d8119baeaffc383dee068ba332cb50 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/porkbun

FROM docker.io/library/caddy:2.10.2@sha256:aa07c7478466e3d6c94a74a02375c3fe57a8332226348bc0c6f594eb08dfdc8a

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
