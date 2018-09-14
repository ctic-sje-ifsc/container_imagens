#!/bin/sh

set -e

# SSH login fix. Otherwise user is kicked off after login
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# Cria um link no /usr/local/bin
ln -s /opt/MATLAB/R2015a/bin/matlab /usr/local/bin/matlab

cat /mnt/passwd >> /etc/passwd
cat /mnt/shadow >> /etc/shadow
cat /mnt/group >> /etc/group
/bin/bash /mnt/cron_att_users.sh &

exec "$@"
