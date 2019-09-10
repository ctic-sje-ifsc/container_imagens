FROM cticsjeifsc/base_ubuntu_servicos_ensino_ctic
# Baseado https://github.com/nickandrew/docker-eagle (Nick Andrew <nick@nick-andrew.net>)

COPY ./docker-entrypoint.sh /
RUN chmod 0755 /docker-entrypoint.sh 

RUN apt-get update && apt-get -y upgrade

RUN apt-get -y install wget bzip2

# Do this early, to cache the huge binary download
RUN wget -q -O /tmp/eagle.tar.gz https://trial2.autodesk.com/NET17SWDLD/2017/EGLPRM/ESD/Autodesk_EAGLE_9.5.0_English_Linux_64bit.tar.gz

# Install particular eagle dependencies
RUN apt-get -y install libnspr4 libglib2.0-0 libnss3 libasound2

RUN apt-get -y install libcups2
RUN apt-get -y install man-db
RUN mkdir -p /opt/eagle-9.5.0

# ------------------------------------------------------------------------
# Everything under here, run as user 'user'
# ------------------------------------------------------------------------

WORKDIR /opt

RUN tar zxpf /tmp/eagle.tar.gz
RUN rm /tmp/eagle.tar.gz

EXPOSE 22
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]