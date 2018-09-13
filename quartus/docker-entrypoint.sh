#!/bin/sh

set -e

echo "PATH=$PATH:/opt/altera/13.0sp1/quartus/bin" >> /etc/environment
echo "export LICENSE_FILE=1800@vm-lan2.sj.ifsc.edu.br" >> /etc/bash.bashrc
echo "export LM_LICENSE_FILE=1800@vm-lan2.sj.ifsc.edu.br" >> /etc/bash.bashrc
cat /mnt/passwd >> /etc/passwd
cat /mnt/shadow >> /etc/shadow
/bin/bash /mnt/cron_att_users.sh &

exec "$@"
