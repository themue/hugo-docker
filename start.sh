#!/bin/sh
SH=/bin/sh
PULL=/pull.sh
HUGO=/go/bin/hugo
HUGO_SOURCE="--source=/src"
HUGO_DESTINATION="--destination=/var/www/site"
HUGO_ARGS="server $HUGO_SOURCE $HUGO_DESTINATION $@"

$SH $PULL &
$HUGO $HUGO_ARGS || exit 1
# EOF