FROM caddy:2.8.1-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/porkbun@4267f6797bf6543d7b20cdc8578a31764face4cf \
    --with github.com/libdns/porkbun@6dda640b5aefc4692dadf90da3756818b6da2d92

FROM caddy:2.8.1

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
