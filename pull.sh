#!/bin/sh
mkdir /site
git clone http://github.com/themue/site.themue.name.git /src
cd /src
while true
do
    git pull
    sleep 300
done