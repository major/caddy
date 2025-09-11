FROM docker.io/library/caddy:2.10.2-builder@sha256:5d3e2fc2ba02ecf51ebbfbbea2ce0ab64d3aa80c99722ed929f8bf973be7e831 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/porkbun

FROM docker.io/library/caddy:2.10.2@sha256:87aa104ed6c658991e1b0672be271206b7cd9fec452d1bf3ed9ad6f8ab7a2348

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
