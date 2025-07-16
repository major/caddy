FROM docker.io/library/caddy:2.10.0-builder@sha256:bcb684def90ebfaee228c239584efa7f4404f5af8dadefadd0bfc15d296cec7c AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/porkbun

FROM docker.io/library/caddy:2.10.0@sha256:c589adee755f51a2c52052d6d424aba7b8cee44ebf57070035f0961c22c053f3

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
