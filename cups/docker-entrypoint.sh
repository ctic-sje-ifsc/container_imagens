#!/bin/sh

set -e

if [ ! -z "${ROOT_PASSWD}" ]
then
    echo "root:${ROOT_PASSWD}" | chpasswd
fi

exec "$@"
