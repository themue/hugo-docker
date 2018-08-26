#!/bin/bash
SOURCE="/src"
DESTINATION="/var/www/html"

if [[ -z ${SITE_REPOSITORY} ]]
then
	exit -1
fi

GIT=git
GIT_DEFAULT_BRANCH="master"
GIT_CLONE_ARGS="clone --recursive ${SITE_REPOSITORY} ${SOURCE}"
GIT_CHECKOUT_ARGS="checkout ${SITE_BRANCH:-$GIT_DEFAULT_BRANCH}"
GIT_SUBMODULE_ARGS="submodule update --recursive --remote"
GIT_PULL_ARGS="pull"

HUGO=/go/bin/hugo
HUGO_SOURCE="--source=${SOURCE}"
HUGO_DESTINATION="--destination=${DESTINATION}"
HUGO_ARGS="${HUGO_SOURCE} ${HUGO_DESTINATION} $@"

SLEEP_ARGS=300

${GIT} ${GIT_CLONE_ARGS}
cd ${SOURCE}
${GIT} ${GIT_CHECKOUT_ARGS}

while true
do
	${GIT} ${GIT_SUBMODULE_ARGS}
	${GIT} ${GIT_PULL_ARGS}
	${HUGO} ${HUGO_ARGS}
	sleep ${SLEEP_ARGS}
done
# EOF
