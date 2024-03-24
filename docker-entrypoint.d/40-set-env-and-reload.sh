#!/bin/sh
set -Eeuo pipefail

cp /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.template

envsubst '\
$W_APP \
$W_PROXY_URL \
$W_CLIENT_MAX_BODY_SIZE \
' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

sh -c "/reloader.sh &"

exit 0
