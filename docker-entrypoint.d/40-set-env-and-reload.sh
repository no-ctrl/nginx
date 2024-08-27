#!/bin/sh
set -Eeuo pipefail

cp /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.template

envsubst '\
$PROXY_URL \
' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

sh -c "/reloader.sh &"

exit 0
