#!/bin/sh

set -e

/usr/bin/dbus-uuidgen --ensure
[ ! -e /var/run/dbus ] && mkdir /var/run/dbus
exec "$@"
