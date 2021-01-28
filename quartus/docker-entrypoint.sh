#!/bin/sh

set -e

echo "export PATH=$PATH:/opt/altera/13.0sp1/quartus/bin" >> /etc/bash.bashrc

echo "export LICENSE_FILE=1800@license-server.sj.ifsc.edu.br" >> /etc/bash.bashrc
echo "export LM_LICENSE_FILE=1800@license-server.sj.ifsc.edu.br" >> /etc/bash.bashrc
echo "export MGLS_LICENSE_FILE=1800@license-server.sj.ifsc.edu.br" >> /etc/bash.bashrc

echo "export LD_LIBRARY_PATH=/opt/altera/13.0sp1/lib32" >> /etc/bash.bashrc

cat /mnt/passwd >> /etc/passwd
cat /mnt/shadow >> /etc/shadow
cat /mnt/group >> /etc/group
/bin/bash /mnt/cron_att_users.sh &
echo "X11UseLocalhost no" >> /etc/ssh/sshd_config

exec "$@"