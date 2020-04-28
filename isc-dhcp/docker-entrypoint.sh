#!/bin/sh

set -e

if [ ${INTERFACE} == "" ]
then
    INTERFACE="eth0"
fi

exec "$@" ${INTERFACE}
