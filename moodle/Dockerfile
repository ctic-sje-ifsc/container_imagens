FROM bitnami/moodle:3.8.2-debian-10-r0
LABEL maintainer "IFSC SJE"

RUN install_packages autoconf build-essential autoconf pkg-config zlib1g-dev

RUN pecl install redis

RUN echo 'extension=redis.so' >> /opt/bitnami/php/etc/php.ini

RUN sed -i -r '/post_max_size/c\post_max_size = 64M' /opt/bitnami/php/etc/php.ini && \
    sed -i -r '/upload_max_filesize/c\upload_max_filesize = 64M' /opt/bitnami/php/etc/php.ini