#!/bin/sh

set -e

sh -c '/bin/sed -i "s/^Listen 80.*/Listen 8083/g" /etc/apache2/ports.conf' 
sh -c '/bin/sed -i "s/Listen 443$/Listen 44383/g" /etc/apache2/ports.conf'
sh -c '/bin/sed -i "1s/.*/<VirtualHost *>/g" /etc/apache2/sites-enabled/001-fog.conf'
sh -c '/bin/sed -i "s/191.36.8.25/191.36.8.25:8083/g" /tftpboot/default.ipxe'
sh -c '/etc/init.d/start.services'

exec "$@"
