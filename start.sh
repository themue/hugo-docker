#!/bin/sh
SH=/bin/sh
PULL=/pull.sh
NGINX=nginx
NGINX_ARGS="-g daemon off;"

$SH $PULL &
$NGINX -g 'daemon off;'
# EOF
