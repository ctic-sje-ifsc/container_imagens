FROM bitnami/moodle:3.8.2-debian-10-r0

ARG BUILD_DATE
ARG VCS_REF
LABEL maintainer="ctic.sje@listas.ifsc.edu.br" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="CTIC-SJE-IFSC Kubernetes: Moodle" \
    org.label-schema.description="Nuvem privada do Câmpus São José do IFSC" \
    org.label-schema.license="MIT" \
    org.label-schema.url="https://moodle.sj.ifsc.edu.br" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/ctic-sje-ifsc/servicos_kubernetes" \
    org.label-schema.vendor="CTIC" \
    org.label-schema.version="3.8.2-debian-10-r0" \
    org.label-schema.schema-version="1.0"

RUN install_packages autoconf build-essential autoconf pkg-config zlib1g-dev && \
    pecl install redis && \
    echo 'extension=redis.so' >> /opt/bitnami/php/etc/php.ini && \
    sed -i -r '/post_max_size/c\post_max_size = 64M' /opt/bitnami/php/etc/php.ini && \
    sed -i -r '/upload_max_filesize/c\upload_max_filesize = 64M' /opt/bitnami/php/etc/php.ini
