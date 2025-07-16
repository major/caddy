FROM docker.io/library/caddy:2.10.0-builder@sha256:bcb684def90ebfaee228c239584efa7f4404f5af8dadefadd0bfc15d296cec7c AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/porkbun

FROM docker.io/library/caddy:2.10.0@sha256:f880657326733fb266a317b4ee31d6a3090a6bbff3dcb0c97833093810d59b46

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
