# Dockerfile for building fogproject server image for Debian 9 (stretch), with all additional software needed.
#
# Version  0.1
FROM debian:stretch-slim

MAINTAINER Ricardo Martins <ricardo.ifsc@gmail.com>

COPY start.services /etc/init.d/start.services
COPY docker-entrypoint.sh /

RUN apt update && \
    apt upgrade -y && \
    apt purge -y ssh openssh-server && \
    apt install git iproute2 -y && \
    chmod 0755 /docker-entrypoint.sh && \
    chmod 0755 /etc/init.d/start.services && \
    git -C /opt clone https://github.com/fogproject/fogproject.git Install_fog && \
    cd /opt/Install_fog/bin ; sh -c '/bin/echo -e "\nNormal\n191.36.8.25\nY\nbond0\nN\nN\nN\nN\nY\n\n\n" | /bin/bash installfog.sh' && \
    /bin/rm -rf /opt/Install_fog

EXPOSE 21 111 2049 8083 44383 69/udp

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD /usr/sbin/apachectl -D FOREGROUND

#README?
#How work the command '/bin/echo -e "\nNormal\n191.36.8.25\nY\nbond0\nN\nN\nN\nN\nY\n\n\n" | /bin/bash installfog.sh'
#Is very simple, for each interaction have a \n (line break) in this case:
#The first \n is a default option for SO system, in my case;
#Next, What type of installation would you like to do? [N/s (Normal/Storage)];
#What is the IP address to be used by this FOG Server? [172.17.0.1]. Here a type de IP address for my server;
#Would you like to change the default network interface from eth0?
#  If you are not sure, select No. [y/N]. I needed change the interface, so a type Y\n;
#For Yes, show another option: What network interface would you like to use? In my case bond0\n
#Would you like to setup a router address for the DHCP server? [Y/n] N\n
#Would you like DHCP to handle DNS? [Y/n] N\n
#Would you like to use the FOG server for DHCP service? [y/N] N\n
#This version of FOG has internationalization support, would  
#  you like to install the additional language packs? [y/N] N\n
#Are you sure you wish to continue (Y/N) Y\n
#Is the MySQL password blank? (Y/n) \n
#And de last option: Press [Enter] key when database is updated/installed. \n
