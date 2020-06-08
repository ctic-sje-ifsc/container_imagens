FROM debian:buster-slim

ARG BUILD_DATE
ARG VCS_REF
LABEL maintainer="ctic.sje@listas.sj.ifsc.edu.br" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="CTIC-SJE-IFSC Kubernetes: CUPS server" \
    org.label-schema.description="Nuvem privada do Câmpus São José do IFSC" \
    org.label-schema.license="MIT" \
    org.label-schema.url="https://projetos.sj.ifsc.edu.br" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/ctic-sje-ifsc/servicos_kubernetes" \
    org.label-schema.vendor="CTIC" \
    org.label-schema.version="2.2.10-6+deb10u3" \
    org.label-schema.schema-version="1.0"

ENV DEBIAN_FRONTEND noninteractive
COPY ./docker-entrypoint.sh /
RUN chmod 0755 /docker-entrypoint.sh && \
    apt update && \
    apt -y upgrade && \
    apt -y install cups && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY ./kyofilter_B /usr/lib/cups/filter/
RUN chmod 0755 /usr/lib/cups/filter/kyofilter_B

EXPOSE 631/TCP
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/cupsd", "-f"]
