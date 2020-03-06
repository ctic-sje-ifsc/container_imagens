FROM alpine:3.10

ARG BUILD_DATE
ARG VCS_REF
LABEL maintainer="ctric.sje@listas.sj.ifsc.edu.br" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="CTIC-SJE-IFSC Kubernetes: phpLDAPadmin" \
    org.label-schema.description="Nuvem privada do Câmpus São José do IFSC" \
    org.label-schema.license="MIT" \
    org.label-schema.url="https://projetos.sj.ifsc.edu.br" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/ctic-sje-ifsc/servicos_kubernetes" \
    org.label-schema.vendor="CTIC" \
    org.label-schema.version="1.2.4" \
    org.label-schema.schema-version="1.0"

COPY ./docker-entrypoint.sh /
RUN chmod 0755 /docker-entrypoint.sh && \
    apk add --update php7-apache2 phpldapadmin && \
    sed -i 's/\/var\/www\/localhost\/htdocs/\/usr\/share\/webapps\/phpldapadmin\/htdocs/g' /etc/apache2/httpd.conf  && \
    mkdir -p /run/apache2 && \
    chown apache /run/apache2 && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

EXPOSE 80
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
