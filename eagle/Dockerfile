FROM debian:jessie

ARG BUILD_DATE
ARG VCS_REF
LABEL maintainer="souzagaabriel@gmail.com" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="CTIC-SJE-IFSC Kubernetes: Eagle" \
      org.label-schema.description="Nuvem privada do Câmpus São José do IFSC" \
      org.label-schema.license="MIT" \
      org.label-schema.url="https://projetos.sj.ifsc.edu.br" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/ctic-sje-ifsc/servicos_kubernetes" \
      org.label-schema.vendor="CTIC"

COPY ./docker-entrypoint.sh /
RUN chmod 0755 /docker-entrypoint.sh && \
    echo 'deb http://ftp.de.debian.org/debian jessie main non-free' >> /etc/apt/sources.list.d/nonfree.list && \
    apt-get update && \
    apt -y upgrade && \
    dpkg --add-architecture i386 && \
    apt-get update && \
    apt -y install eagle gedit

RUN echo 'deb http://packages.x2go.org/debian stable main' >> /etc/apt/sources.list.d/x2go.list && \
    echo 'deb-src http://packages.x2go.org/debian stable main' >> /etc/apt/sources.list.d/x2go.list && \
    apt -y install curl mount fuse sudo git gnupg gnupg2 apt-utils && \
    apt-key adv --no-tty --keyserver keyserver.ubuntu.com --recv-keys E1F958385BFE2B6E && \
    apt update && \
    apt -y install openssh-server x2goserver x2goserver-xsession && \
    apt -y install libnss-ldap libpam-ldap ldap-utils nscd && \
    #apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p /var/run/sshd && \
    install -d -g root -m 0700 -o root /root/.ssh

EXPOSE 22
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]

