#!/usr/bin/with-contenv bashio
set -e

SERVER_ADDR=$(bashio::config 'server_addr')
SERVER_PORT=$(bashio::config 'server_port')
TOKEN=$(bashio::config 'token')
PROXY_NAME=$(bashio::config 'proxy_name')
CUSTOM_DOMAINS=$(bashio::config 'custom_domains')

cat <<EOF >/etc/frpc.ini
[common]
server_addr = ${SERVER_ADDR}
server_port = ${SERVER_PORT}
token = ${TOKEN}

[${PROXY_NAME}]
type = http
local_ip = 127.0.0.1
local_port = 8123
custom_domains = ${CUSTOM_DOMAINS}
EOF

echo "Starting frpc with config:"
cat /etc/frpc.ini

exec /usr/local/bin/frpc -c /etc/frpc.ini
