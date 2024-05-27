#!/bin/sh

if [ -z "$DOMAIN" ]; then
cat >&2 <<-EOF
Error: Environment variable DOMAIN is required.
EOF
exit 1
fi

if [ -z "$PROXY_URL" ]; then
cat >&2 <<-EOF
Error: Environment variable PORT is required.
EOF
exit 1
fi


cat <<EOF > /etc/caddy/Caddyfile
$DOMAIN

reverse_proxy $PROXY_URL
EOF

exec "$@"
