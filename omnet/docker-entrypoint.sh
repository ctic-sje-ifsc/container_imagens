#!/bin/sh

set -e

#PATH
echo "PATH=$PATH:/opt/omnetpp/omnetpp-5.4.1/bin" >> /etc/environment

chmod -R 1777 /opt/omnetpp
touch /opt/omnetpp/omnetpp-5.4.1/ide/error.log
chmod 777 /opt/omnetpp/omnetpp-5.4.1/ide/error.log

exec "$@"
