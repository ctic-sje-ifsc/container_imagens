FROM alpine:3.7

ARG BUILD_DATE
ARG VCS_REF
LABEL maintainer="boidacarapreta@gmail.com" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="CTIC-SJE-IFSC Kubernetes: D-Bus" \
      org.label-schema.description="Nuvem privada do Câmpus São José do IFSC" \
      org.label-schema.license="epl-v10" \
      org.label-schema.url="https://projetos.sj.ifsc.edu.br" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/ctic-sje-ifsc" \
      org.label-schema.vendor="CTIC" \
      org.label-schema.version="1.10" \
      org.label-schema.schema-version="1.0"

COPY ./docker-entrypoint.sh /
RUN chmod 0755 /docker-entrypoint.sh && \
    apk add --update dbus && \
    adduser -h /dev/null -s /sbin/nologin -S -D -H dbus && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

USER dbus
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/bin/dbus-daemon","--system","--nofork"]
