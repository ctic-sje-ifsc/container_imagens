# Baseado em:
# - https://docs.docker.com/engine/examples/running_ssh_service/
# - https://github.com/theodotos/debian-ssh-docker

FROM node:6

ARG BUILD_DATE
ARG VCS_REF
LABEL maintainer="souzagaabriel@gmail.com" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="CTIC-SJE-IFSC Kubernetes: Octave client" \
      org.label-schema.description="Nuvem privada do Câmpus São José do IFSC" \
      org.label-schema.license="MIT" \
      org.label-schema.url="https://projetos.sj.ifsc.edu.br" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/ctic-sje-ifsc/servicos_kubernetes" \
      org.label-schema.vendor="CTIC" \
      org.label-schema.version="4.0.3" \
      org.label-schema.schema-version="1.0"

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /usr/src/app

COPY ./docker-entrypoint.sh /

RUN chmod 0755 /docker-entrypoint.sh && \
    git clone https://github.com/lucaslouca/video-conference-webrtc.git && \
    cd video-conference-webrtc && \
    npm install

EXPOSE 1337

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD [ "npm", "start" ]