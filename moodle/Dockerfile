FROM bitnami/moodle:3.7.0-debian-9-r24
LABEL maintainer "IFSC SJE"

RUN install_packages autoconf build-essential

RUN pecl install redis

RUN echo 'extension=redis.so' >> /opt/bitnami/php/etc/php.ini

RUN sed -i -r '/post_max_size/c\post_max_size = 40M' /opt/bitnami/php/etc/php.ini && \
    sed -i -r '/upload_max_filesize/c\upload_max_filesize = 40M' /opt/bitnami/php/etc/php.ini