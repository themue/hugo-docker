#!/bin/sh
SH=/bin/sh
PULL=/pull.sh
HUGO=/go/bin/hugo
HUGO_SOURCE="--source=/src"
HUGO_DESTINATION="--destination=/site"
HUGO_BIND="--bind=0.0.0.0"
HUGO_ARGS="server -v $HUGO_SOURCE $HUGO_DESTINATION $HUGO_BIND $@"

mkdir /site
git clone http://github.com/themue/site.themue.name.git /src

$SH $PULL &
sleep 10
$HUGO $HUGO_ARGS || exit 1
# EOF
