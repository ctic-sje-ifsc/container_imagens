FROM alpine:3.10

ARG BUILD_DATE
ARG VCS_REF
LABEL maintainer="ctric.sje@listas.sj.ifsc.edu.br" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="CTIC-SJE-IFSC Kubernetes: OpenLDAP server" \
    org.label-schema.description="Nuvem privada do Câmpus São José do IFSC" \
    org.label-schema.license="MIT" \
    org.label-schema.url="https://projetos.sj.ifsc.edu.br" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/ctic-sje-ifsc/servicos_kubernetes" \
    org.label-schema.vendor="CTIC" \
    org.label-schema.version="2.4.48" \
    org.label-schema.schema-version="1.0"

COPY ./docker-entrypoint.sh /
RUN chmod 0755 /docker-entrypoint.sh && \
    apk add --update openldap openldap-back-mdb && \
    mkdir -p /run/openldap && \
    chown ldap /run/openldap && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

EXPOSE 1024
VOLUME ["/var/lib/openldap"]
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/slapd", "-d", "160", "-h", "ldap://0.0.0.0:1024"]

USER ldap
