#!/bin/sh

if [ -d '/etc/runit/sv' ]; then
    echo '/etc/runit/sv'
elif [ -d '/etc/sv' ]; then
    echo '/etc/sv'
else
    echo ''
fi
