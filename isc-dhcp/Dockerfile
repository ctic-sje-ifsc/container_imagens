FROM debian:buster-slim

ARG BUILD_DATE
ARG VCS_REF
LABEL maintainer="ctic.sje@listas.sj.ifsc.edu.br" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="CTIC-SJE-IFSC Kubernetes: DHCP server" \
    org.label-schema.description="Nuvem privada do Câmpus São José do IFSC" \
    org.label-schema.license="MIT" \
    org.label-schema.url="https://projetos.sj.ifsc.edu.br" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/ctic-sje-ifsc/servicos_kubernetes" \
    org.label-schema.vendor="CTIC" \
    org.label-schema.version="4.4.1" \
    org.label-schema.schema-version="1.0"

ENV DEBIAN_FRONTEND noninteractive
RUN apt update && \
    apt -y upgrade && \
    apt -y install isc-dhcp-server && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 67/UDP
EXPOSE 67/TCP
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/dhcpd", "-4", "-d"]
