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
