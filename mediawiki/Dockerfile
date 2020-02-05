FROM mediawiki:1.31.6

ARG DEBIAN_FRONTEND=noninteractive

 # Install needed php extensions: ldap sockets (memcached)
RUN \
    apt-get update && \
    apt-get install libldap2-dev -y && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \
    docker-php-ext-install ldap sockets

 # php.ini changes
RUN rm /usr/local/etc/php/php.ini-development; mv /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

RUN sed -i -r '/post_max_size/c\post_max_size = 32M' /usr/local/etc/php/php.ini && \
    sed -i -r '/upload_max_filesize/c\upload_max_filesize = 32M' /usr/local/etc/php/php.ini

 # Adicionado para resolver links da wiki antiga.
RUN ln -s /var/www/html /var/www/html/wiki