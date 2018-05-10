#!/bin/sh

set -e

if [ -f /var/lib/samba/wins.dat ]
then
    rm -f /var/lib/samba/wins.dat
fi
mkdir -p /var/lib/samba/private/msg.sock
chmod 0700 /var/lib/samba/private/msg.sock

exec "$@" < /dev/null
