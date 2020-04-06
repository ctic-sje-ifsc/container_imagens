#!/bin/sh

set -e

# SSH login fix. Otherwise user is kicked off after login
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

echo "X11UseLocalhost no" >> /etc/ssh/sshd_config

exec "$@"
