#!/bin/sh
SOURCE="/src"
DESTINATION="/usr/share/nginx/html"

GIT=git
GIT_CLONE_ARGS="clone --recursive $SITE_REPOSITORY $SOURCE"
GIT_SUBMODULE_ARGS="submodule update --init --recursive"
GIT_PULL_ARGS="pull"

HUGO=/go/bin/hugo
HUGO_SOURCE="--source=$SOURCE"
HUGO_DESTINATION="--destination=$DESTINATION"
HUGO_ARGS="$HUGO_SOURCE $HUGO_DESTINATION $@"

SLEEP_ARGS=300

$GIT $GIT_CLONE_ARGS
cd $SOURCE
while true
do
	$GIT $GIT_SUBMODULE_ARGS
	$GIT $GIT_PULL_ARGS
	$HUGO $HUGO_ARGS
	sleep $SLEEP_ARGS
done
# EOF
