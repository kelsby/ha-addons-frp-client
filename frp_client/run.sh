#!/bin/bash
set -e

cat <<EOF >/etc/frpc.ini
[common]
server_addr = ${SERVER_ADDR:-127.0.0.1}
server_port = ${SERVER_PORT:-7000}
token = ${TOKEN:-changeme}

[${PROXY_NAME:-ha}]
type = http
local_ip = 127.0.0.1
local_port = 8123
custom_domains = ${CUSTOM_DOMAINS:-ha.example.com}
EOF

echo "Starting frpc with config:"
cat /etc/frpc.ini

exec /usr/local/bin/frpc -c /etc/frpc.ini
