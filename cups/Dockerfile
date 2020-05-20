FROM alpine:latest
#
# BUILD:
#   wget https://raw.githubusercontent.com/thbe/docker-cups/master/Dockerfile
#   docker build --rm --no-cache -t thbe/cups .
#
# USAGE:
#   wget https://raw.githubusercontent.com/thbe/docker-cups/master/start_cups.sh
#   ./start_cups.sh
#

# Set metadata
LABEL maintainer="Ricardo Martins <ricardo.ifsc@gmail.com>"
LABEL version="2.0"

# Set environment
ENV LANG pt_BR.UTF-8
ENV TERM xterm

# Copy configuration files
COPY cupsd.conf /etc/cups/cupsd.conf
COPY printers.conf /etc/cups/printers.conf
COPY ppd /etc/cups/ppd/
COPY kyofilter_B /usr/lib/cups/filter/kyofilter_B
COPY ./docker-entrypoint.sh /

RUN chmod 0755 /docker-entrypoint.sh && \
 apk update --no-cache && apk add --no-cache cups cups-filters procps ghostscript

EXPOSE 631 137/udp 139/tcp 445/tcp

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/usr/sbin/cupsd", "-f"]
