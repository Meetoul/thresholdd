#!/bin/sh

if [ -d '/run/runit/service' ]; then
    echo '/run/runit/service'
elif [ -d '/var/service' ]; then
    echo '/var/service'
else
    echo ''
fi
