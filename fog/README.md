
## In the file [Dockerfile](Dockerfile):

### How work the command '/bin/echo -e "\nNormal\nY\neth0\nN\nN\n\n\n\nY\n\n\n" | /bin/bash installfog.sh'

Is very simple, for each interaction have a \n (line break) in this case:

* The first \n is a default option for SO system, in my case "2) Debian Based Linux";
* Next, What type of installation would you like to do? [N/s (Normal/Storage)];
* Would you like to change the default network interface from enp0s3?
* * If you are not sure, select No. [y/N]. I needed change the interface, so a type Y\n;
* * For Yes, show another option: What network interface would you like to use? In my case eth0\n
* Would you like to change the default hostname sj-lin-imglabdeb9-123?
* * The fully qualified hostname is used for the webserver certificate.
* * If you are not sure, select No. [y/N] N\n
* Would you like to setup a router address for the DHCP server? [Y/n] N\n
* Would you like DHCP to handle DNS? [Y/n] N\n
* Would you like to use the FOG server for DHCP service? [y/N] \n
* This version of FOG has internationalization support, would
* * you like to install the additional language packs? [y/N] \n
* Are you sure you wish to continue (Y/N) Y\n
* Is the MySQL password blank? (Y/n) \n
* And de last option: Press [Enter] key when database is updated/installed. \n

## In the file [docker-entrypoint.sh](docker-entrypoint.sh):

If you want to change default port:

```sh
sh -c '/bin/sed -i "s/^Listen 80.*/Listen 8083/g" /etc/apache2/ports.conf'
sh -c '/bin/sed -i "s/Listen 443$/Listen 44383/g" /etc/apache2/ports.conf'
sh -c '/bin/sed -i "1s/.*/<VirtualHost *>/g" /etc/apache2/sites-enabled/000-default.conf'
sh -c '/bin/sed -i "1s/.*/<VirtualHost *>/g" /etc/apache2/sites-enabled/001-fog.conf'
sh -c '/bin/sed -i "s/191.36.8.25/191.36.8.25:8083/g" /tftpboot/default.ipxe'
```

else, you can remove this lines.
