# Baseado em:
# - https://docs.docker.com/engine/examples/running_ssh_service/
# - https://github.com/theodotos/debian-ssh-docker

FROM ubuntu:18.04

ARG BUILD_DATE
ARG VCS_REF
LABEL maintainer="souzagaabriel@gmail.com" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="CTIC-SJE-IFSC Kubernetes: imagem base Ubuntu Stable com x2goserver, ssh e LDAP client" \
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
    apt -y install software-properties-common && \
    #apt -y install curl mount libneon27 davfs2 fuse sudo gnupg git apt-utils && \
    apt -y install curl mount libneon27=0.30.2-2build1 davfs2 fuse sudo gnupg git apt-utils && \
    add-apt-repository ppa:x2go/stable && \
    apt update && \
    apt -y install openssh-server x2goserver x2goserver-xsession xterm && \
    apt -y install libnss-ldap libpam-ldap ldap-utils nscd && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p /var/run/sshd && \
    install -d -g root -m 0700 -o root /root/.ssh

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]