FROM alpine:latest

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
    org.label-schema.version="2.3.3-r0" \
    org.label-schema.schema-version="1.0"

COPY ./docker-entrypoint.sh /
RUN chmod 0755 /docker-entrypoint.sh && \
    apk add --update cups cups-filters procps ghostscript && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

EXPOSE 631/TCP
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/cupsd", "-f"]
