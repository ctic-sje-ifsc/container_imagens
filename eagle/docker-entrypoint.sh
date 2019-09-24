#!/bin/sh

set -e

cat /mnt/passwd >> /etc/passwd
cat /mnt/shadow >> /etc/shadow
cat /mnt/group >> /etc/group
/bin/bash /mnt/cron_att_users.sh &
echo "X11UseLocalhost no" >> /etc/ssh/sshd_config
chmod -R o+rx /opt/*

exec "$@"
