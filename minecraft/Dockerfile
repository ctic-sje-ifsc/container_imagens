FROM openjdk:8-alpine

ARG BUILD_DATE
ARG VCS_REF
LABEL maintainer="boidacarapreta@gmail.com" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="CTIC-SJE-IFSC Kubernetes: Minecraft server" \
      org.label-schema.description="Nuvem privada do Câmpus São José do IFSC" \
      org.label-schema.license="MIT" \
      org.label-schema.url="https://projetos.sj.ifsc.edu.br" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/ctic-sje-ifsc/servicos_kubernetes" \
      org.label-schema.vendor="CTIC" \
      org.label-schema.version="1.12.2" \
      org.label-schema.schema-version="1.0"

ARG minecraft_version=1.12.2
ENV DEBIAN_FRONTEND noninteractive
COPY ./docker-entrypoint.sh /
RUN chmod 0755 /docker-entrypoint.sh && \
    apk add --update curl && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* && \
    adduser -D -h /minecraft -G nogroup -s /bin/bash minecraft

EXPOSE 25565/tcp
USER minecraft
WORKDIR /minecraft
VOLUME ["/minecraft"]
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/bin/java", "-Xms1G", "-Xmx1G", "-jar", "server.jar", "nogui"]
