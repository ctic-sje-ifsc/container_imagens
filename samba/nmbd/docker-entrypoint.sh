#!/bin/sh

set -e

if [ -f /var/lib/samba/wins.dat ]
then
    rm -f /var/lib/samba/wins.dat
fi
exec "$@" < /dev/null
