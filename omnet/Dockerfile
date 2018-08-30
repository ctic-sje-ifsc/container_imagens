# Baseado em:
# - https://github.com/ryankurte/docker-omnetpp/blob/master/Dockerfile
# - https://github.com/leszekbulawa/omnetpp-docker/blob/master/Dockerfile

FROM cticsjeifsc/base_ubuntu_servicos_ensino_ctic

ARG BUILD_DATE
ARG VCS_REF
LABEL maintainer="souzagaabriel@gmail.com" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="CTIC-SJE-IFSC Kubernetes: Omnet++ client" \
      org.label-schema.description="Nuvem privada do Câmpus São José do IFSC" \
      org.label-schema.license="MIT" \
      org.label-schema.url="https://projetos.sj.ifsc.edu.br" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/ctic-sje-ifsc/servicos_kubernetes" \
      org.label-schema.vendor="CTIC" \
      org.label-schema.version="5.4.1" \
      org.label-schema.schema-version="1.0"

COPY ./docker-entrypoint.sh /
RUN chmod 0755 /docker-entrypoint.sh && \
    apt-get update

# General dependencies
RUN apt-get install -y \
    clang \
    git \
    wget \
    vim \
    build-essential \
    gcc \
    g++ \
    bison \
    flex \
    perl \
    python \
    python3 \
    qt5-default \
    libqt5opengl5-dev \
    tcl-dev \ 
    tk-dev \
    libxml2-dev \
    zlib1g-dev \
    default-jre \
    doxygen \
    graphviz \
    xvfb \
    libpcap-dev \
    packagekit-gtk3-module \
    libcanberra-gtk-module \
    libatk-adaptor \ 
    libgail-common

# QT4 components
RUN apt-get install -y \
    libopenscenegraph-3.4-dev \
    openscenegraph-plugin-osgearth \
    libosgearth-dev \
    qt5-default \
    libxml2-dev \
    zlib1g-dev \
    default-jre \
    libwebkitgtk-3.0-0 \
    openmpi-bin \
    libopenmpi-dev

# OMNeT++ 5

# Create working directory
RUN mkdir -p /opt/omnetpp
WORKDIR /opt/omnetpp

# Omnet++ source is already in repository. Copy it to container and unpack
COPY omnetpp-5.4.1-src-linux.tgz /opt/omnetpp

RUN tar -xf omnetpp-5.4.1-src-linux.tgz

# Compilation requires path to be set
ENV PATH $PATH:/opt/omnetpp/omnetpp-5.4.1/bin

# Configure and compile omnet++
WORKDIR /opt/omnetpp/omnetpp-5.4.1
RUN xvfb-run ./configure && \
    make

# Cleanup
RUN apt-get clean && \
  rm -rf /var/lib/apt && \
  rm /opt/omnetpp/omnetpp-5.4.1-src-linux.tgz

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]

