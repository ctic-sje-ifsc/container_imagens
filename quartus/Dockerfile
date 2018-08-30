# Baseado em:
# - https://github.com/ryankurte/docker-omnetpp/blob/master/Dockerfile
# - https://github.com/leszekbulawa/omnetpp-docker/blob/master/Dockerfile
# - https://mil.ufl.edu/3701/docs/quartus/quartus15.0_Linux_installation_instructions.pdf

FROM cticsjeifsc/base_ubuntu_servicos_ensino_ctic

ARG BUILD_DATE
ARG VCS_REF
LABEL maintainer="souzagaabriel@gmail.com" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="CTIC-SJE-IFSC Kubernetes: Quartus" \
      org.label-schema.description="Nuvem privada do Câmpus São José do IFSC" \
      org.label-schema.license="MIT" \
      org.label-schema.url="https://projetos.sj.ifsc.edu.br" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/ctic-sje-ifsc/servicos_kubernetes" \
      org.label-schema.vendor="CTIC" \
      org.label-schema.version="13.0sp1" \
      org.label-schema.schema-version="1.0"

COPY ./docker-entrypoint.sh /
RUN chmod 0755 /docker-entrypoint.sh && \
    apt update && \
    apt -y upgrade && \
    dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y libc6:i386 libpng16-16:i386 libsm6:i386 libncurses5:i386 libstdc++6:i386 libxft2:i386 libxext6:i386 lib32z1 libbz2-1.0:i386 libxrender1:i386 libfreetype6:i386 libfontconfig1:i386 && \       
    wget -q -O /tmp/libpng12.deb http://mirrors.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb && \
    dpkg -i /tmp/libpng12.deb && \
    rm /tmp/libpng12.deb && \
    wget -q -O /tmp/libpng12.deb http://mirrors.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_i386.deb && \
    dpkg -i /tmp/libpng12.deb && \
    rm /tmp/libpng12.deb && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]
