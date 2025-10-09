FROM docker.io/library/caddy:2.10.2-builder@sha256:64c76bdfa2016d84eede962de3f51987771ab6a647a696a11448190b0234c63a AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/porkbun

FROM docker.io/library/caddy:2.10.2@sha256:614bbc6da7ec42f3c76077e86f429297047680f9cb420ad0f07a8fe049193d89

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
