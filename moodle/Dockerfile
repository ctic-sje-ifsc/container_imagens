FROM bitnami/moodle:3.8.0-debian-9-r0
LABEL maintainer "IFSC SJE"

RUN install_packages autoconf build-essential autoconf pkg-config zlib1g-dev libmemcached-dev

RUN pecl install memcached redis

RUN echo 'extension=memcached.so' >> /opt/bitnami/php/etc/php.ini
RUN echo 'extension=redis.so' >> /opt/bitnami/php/etc/php.ini

RUN sed -i -r '/post_max_size/c\post_max_size = 64M' /opt/bitnami/php/etc/php.ini && \
    sed -i -r '/upload_max_filesize/c\upload_max_filesize = 64M' /opt/bitnami/php/etc/php.ini