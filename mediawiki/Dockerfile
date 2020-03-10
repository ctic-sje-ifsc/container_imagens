FROM mediawiki:1.31.6

ARG BUILD_DATE
ARG VCS_REF
LABEL maintainer="ctic.sje@listas.ifsc.edu.br" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="CTIC-SJE-IFSC Kubernetes: Mediawiki" \
    org.label-schema.description="Nuvem privada do Câmpus São José do IFSC" \
    org.label-schema.license="MIT" \
    org.label-schema.url="https://wiki.sj.ifsc.edu.br" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/ctic-sje-ifsc/servicos_kubernetes" \
    org.label-schema.vendor="CTIC" \
    org.label-schema.version="1.31.6" \
    org.label-schema.schema-version="1.0"

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install libldap2-dev -y && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \
    docker-php-ext-install ldap sockets && \
    rm /usr/local/etc/php/php.ini-development; mv /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.inised -i -r '/post_max_size/c\post_max_size = 32M' /usr/local/etc/php/php.ini && \
    sed -i -r '/upload_max_filesize/c\upload_max_filesize = 32M' /usr/local/etc/php/php.ini && \
    ln -s /var/www/html /var/www/html/wiki
