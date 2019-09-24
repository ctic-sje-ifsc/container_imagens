#!/bin/sh

set -e

#PATH
echo "PATH=$PATH:/opt/eagle-9.5.0" >> /etc/environment

cat /mnt/passwd >> /etc/passwd
cat /mnt/shadow >> /etc/shadow
cat /mnt/group >> /etc/group
/bin/bash /mnt/cron_att_users.sh &
echo "X11UseLocalhost no" >> /etc/ssh/sshd_config
chmod -R o+rx /opt/*

exec "$@"
