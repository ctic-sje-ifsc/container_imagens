# Baseado em:
# - https://github.com/cps-sei/swim/blob/master/docker/omnetpp-vnc/Dockerfile

FROM cticsjeifsc/base_servicos_ensino_ctic

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

RUN apt-get update

# General dependencies
RUN apt-get install -y \
    git \
    wget \
    vim \
    build-essential \
    gcc \
    g++ \
    bison \
    flex \
    perl \
    qt5-default \
    tcl-dev \
    tk-dev \
    libxml2-dev \
    zlib1g-dev \
    default-jre \
    doxygen \
    graphviz \
    xvfb

# QT
RUN apt-get install -y \
    libopenscenegraph-dev \
    openscenegraph-plugin-osgearth \
    libosgearth-dev \
    qt5-default \
    libxml2-dev \
    zlib1g-dev \
    default-jre \
    libqt5opengl5-dev \
    libwebkitgtk-3.0-0

# Create working directory
RUN mkdir -p /opt/omnetpp
WORKDIR /opt/omnetpp

# Omnet++ source is already in repository. Copy it to container and unpack
COPY omnetpp-5.4.1-src-linux.tgz /opt/omnetpp
RUN tar xf omnetpp-5.4.1-src-linux.tgz

WORKDIR /opt/omnetpp/omnetpp-5.4.1

# Set path for compilation
ENV PATH $PATH:/opt/omnetpp/omnetpp-5.4.1/bin

# Configure and compile Omnet++
RUN xvfb-run ./configure WITH_OSG=no WITH_OSGEARTH=no && make

# Cleanup
RUN apt-get clean && \
    rm -rf /var/lib/apt && \
rm /opt/omnetpp/omnetpp-5.4.1-src-linux.tgz

WORKDIR $HOME