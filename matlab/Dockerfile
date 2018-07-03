# Baseado em:
# - https://docs.docker.com/engine/examples/running_ssh_service/
# - https://github.com/theodotos/debian-ssh-docker

FROM debian:stable

ARG BUILD_DATE
ARG VCS_REF
LABEL maintainer="souzagaabriel@gmail.com" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="CTIC-SJE-IFSC Kubernetes: MATLAB client" \
      org.label-schema.description="Nuvem privada do Câmpus São José do IFSC" \
      org.label-schema.license="MIT" \
      org.label-schema.url="https://projetos.sj.ifsc.edu.br" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/ctic-sje-ifsc/servicos_kubernetes" \
      org.label-schema.vendor="CTIC" \
      org.label-schema.version="R2015a" \
      org.label-schema.schema-version="1.0"

ENV DEBIAN_FRONTEND noninteractive
COPY ./docker-entrypoint.sh /
RUN chmod 0755 /docker-entrypoint.sh && \
    apt update && \
    apt -y upgrade && \
    echo 'deb http://packages.x2go.org/debian stable main' >> /etc/apt/sources.list.d/x2go.list && \
    echo 'deb-src http://packages.x2go.org/debian stable main' >> /etc/apt/sources.list.d/x2go.list && \
    apt -y install curl mount davfs2 fuse sudo gnupg apt-utils && \
    apt-key adv --keyserver keyserver.cais.rnp.br --receive-keys 0xe1f958385bfe2b6e && \
    apt update && \
    apt -y install openssh-server x2go-keyring x2goserver x2goserver-xsession libglu1-mesa && \
    apt -y install libnss-ldap libpam-ldap ldap-utils nscd && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p /var/run/sshd

EXPOSE 22
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]
