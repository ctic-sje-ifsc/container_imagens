#!/bin/sh

set -e

if [ "${PASSWD_LDAP}" != "" ]
then
    smbpasswd -w ${PASSWD_LDAP}
fi

exec "$@"
