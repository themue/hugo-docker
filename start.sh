#!/bin/sh
SH=/bin/sh
PULL=/pull.sh
HUGO=/go/bin/hugo
HUGO_THEME=hugo_theme_robust

$SH $PULL &
$HUGO server --watch=true --source="/src" --theme="$HUGO_THEME" --destination="/var/www/site" --baseUrl="$HUGO_BASEURL" --bind="0.0.0.0" "$@" || exit 1