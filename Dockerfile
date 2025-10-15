FROM docker.io/library/caddy:2.10.2-builder@sha256:3c5f636b41a6772c66b45f2a62ef1e2bac9c9f80dc12ea097cdb1b4dc5a80048 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/porkbun

FROM docker.io/library/caddy:2.10.2@sha256:786b7527345b82faf39e664ea26c71cc57bcb3a89bb2eada94bf0b2dc5304f0a

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
