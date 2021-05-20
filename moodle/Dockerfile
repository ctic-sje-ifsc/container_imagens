FROM php:7.4-apache-buster

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
    org.label-schema.version="3.9" \
    org.label-schema.schema-version="1.0"

RUN curl https://download.moodle.org/download.php/direct/stable39/moodle-latest-39.tgz --output moodle.tgz && \
    tar zxf moodle.tgz --strip-components=1 && \
    rm moodle.tgz && \
    mkdir /var/www/moodledata && \
    chown -R www-data:www-data /var/www/

RUN apt update && \
    apt install libzip-dev libpng-dev libicu-dev libxml2-dev unzip libldap2-dev -y && \
    docker-php-ext-install gd intl mysqli opcache soap xmlrpc zip && \
    docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu && \
    docker-php-ext-install ldap && \
    apt purge libzip-dev libpng-dev libicu-dev libxml2-dev libldap2-dev -y && \
    rm -rf /var/lib/apt/lists/*

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" && \
    pecl install redis && \
    echo 'extension=redis.so' >> "$PHP_INI_DIR/php.ini" && \
    sed -i -r '/post_max_size/c\post_max_size = 64M' "$PHP_INI_DIR/php.ini" && \
    sed -i -r '/upload_max_filesize/c\upload_max_filesize = 64M' "$PHP_INI_DIR/php.ini"

RUN curl https://moodle.org/plugins/download.php/23807/mod_vpl_moodle310_2021033113.zip --output mod_vpl_moodle39.zip && \
    unzip mod_vpl_moodle39.zip -d /var/www/html/mod && \
    rm mod_vpl_moodle39.zip && \
    chown -R www-data:www-data /var/www/

EXPOSE 80/TCP