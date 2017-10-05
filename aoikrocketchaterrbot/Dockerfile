# Baseado em https://github.com/AoiKuiyuyou/AoikRocketChatErrbot
FROM python:3.6
MAINTAINER Ederson Torresini <boidacarapreta@gmail.com>

ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="CTIC-SJE-IFSC Kubernetes: Errbot chatbot + AoikRocketChatErrbot plugin" \
      org.label-schema.description="Nuvem privada do Câmpus São José do IFSC" \
      org.label-schema.license="MIT" \
      org.label-schema.url="https://projetos.sj.ifsc.edu.br" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/ctic-sje-ifsc/kubernetes" \
      org.label-schema.vendor="CTIC" \
      org.label-schema.version="0.1.0" \
      org.label-schema.schema-version="1.0"

COPY ./docker-entrypoint.sh /
RUN chmod 0755 /docker-entrypoint.sh && \
    git clone https://github.com/AoiKuiyuyou/AoikRocketChatErrbot && \
    cd AoikRocketChatErrbot && \
    python setup.py install && \
    # https://github.com/errbotio/err-backend-gitter/issues/30
    sed -i 's/, threaded=threaded//g' /usr/local/lib/python3.6/site-packages/errbot-5.1.2-py3.6.egg/errbot/core.py && \
    groupadd errbot && \
    useradd -g errbot -d /AoikRocketChatErrbot -s /bin/false errbot && \
    chown -R errbot:errbot /AoikRocketChatErrbot && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR "/AoikRocketChatErrbot/src/aoikrocketchaterrbot"
USER "errbot"
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["python", "-m", "errbot.cli"]
