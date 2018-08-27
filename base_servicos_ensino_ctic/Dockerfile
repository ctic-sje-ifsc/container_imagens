# Baseado em:
# - https://docs.docker.com/engine/examples/running_ssh_service/
# - https://github.com/theodotos/debian-ssh-docker

FROM debian:stable

ARG BUILD_DATE
ARG VCS_REF
LABEL maintainer="souzagaabriel@gmail.com" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="CTIC-SJE-IFSC Kubernetes: imagem base Debian Stable com x2goserver, ssh e LDAP client" \
      org.label-schema.description="Nuvem privada do Câmpus São José do IFSC" \
      org.label-schema.license="MIT" \
      org.label-schema.url="https://projetos.sj.ifsc.edu.br" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/ctic-sje-ifsc/servicos_kubernetes" \
      org.label-schema.vendor="CTIC" \
      org.label-schema.version="0.0.1" \
      org.label-schema.schema-version="1.0"

ENV DEBIAN_FRONTEND noninteractive
RUN apt update && \
    apt -y upgrade && \
    echo 'deb http://packages.x2go.org/debian stable main' >> /etc/apt/sources.list.d/x2go.list && \
    echo 'deb-src http://packages.x2go.org/debian stable main' >> /etc/apt/sources.list.d/x2go.list && \
    apt -y install curl mount davfs2 fuse sudo gnupg apt-utils && \
    apt-key adv --recv-keys --keyserver keys.gnupg.net E1F958385BFE2B6E && \
    apt update && \
    apt -y install openssh-server x2go-keyring x2goserver x2goserver-xsession && \
    apt -y install libnss-ldap libpam-ldap ldap-utils nscd && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p /var/run/sshd && \
    install -d -g root -m 0700 -o root /root/.ssh

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]