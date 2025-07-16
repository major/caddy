FROM docker.io/library/caddy:2.10.0-builder@sha256:bcb684def90ebfaee228c239584efa7f4404f5af8dadefadd0bfc15d296cec7c AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/porkbun

FROM docker.io/library/caddy:2.10.0@sha256:5ce77de8c70cbdbd17ea69162b5a0539503fb9e1a9329cce42dc0f54821cc2af

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
