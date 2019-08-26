# Baseado em:
# - https://github.com/ryankurte/docker-omnetpp/blob/master/Dockerfile
# - https://github.com/leszekbulawa/omnetpp-docker/blob/master/Dockerfile
# - https://mil.ufl.edu/3701/docs/quartus/quartus15.0_Linux_installation_instructions.pdf

FROM debian:jessie-backports

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

ENV DEBIAN_FRONTEND noninteractive

# basic packages
RUN echo "deb [check-valid-until=no] http://cdn-fastly.deb.debian.org/debian jessie main" > /etc/apt/sources.list.d/jessie.list && \
    echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/backports.list && \
    sed -i '/deb http:\/\/deb.debian.org\/debian jessie-updates main/d' /etc/apt/sources.list && \
    echo "Acquire::Check-Valid-Until \"false\";" > /etc/apt/apt.conf.d/100disablechecks && \
    apt-get update && \
    apt-get -y install git expect emacs24-nox libtcmalloc-minimal4 locales wget

RUN apt update && \
    apt -y upgrade && \
    apt -y install curl mount davfs2 fuse sudo git gnupg gnupg2 apt-utils locales && \
    apt -y install openssh-server && \
    apt -y install libnss-ldap libpam-ldap ldap-utils nscd

# Set LOCALE to UTF8
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

COPY ./docker-entrypoint.sh /
RUN chmod 0755 /docker-entrypoint.sh && \
    echo 'deb http://packages.x2go.org/debian jessie main' >> /etc/apt/sources.list.d/x2go.list && \
    apt -y install curl mount davfs2 fuse sudo git gnupg gnupg2 apt-utils && \
    apt-key adv --no-tty --keyserver keyserver.ubuntu.com --recv-keys E1F958385BFE2B6E && \
    apt update && \
    apt -y install openssh-server x2goserver-x2goagent x2goserver x2goserver-xsession && \
    apt update && \
    apt -y upgrade && \
    dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y wget libpng12-0 libxft2 libxft2:i386 lib32ncurses5 libpng12-0:i386 libc6:i386 libsm6:i386 libncurses5:i386 libstdc++6:i386 libxft2:i386 libxext6:i386 lib32z1 libbz2-1.0:i386 libxrender1:i386 bzip2:i386 libfreetype6:i386 libfontconfig1:i386 && \
    # #libtcmalloc-minimal4
    # wget -q -O /tmp/libtcmalloc-minimal4_2.2.1-0.2_amd64.deb http://ftp.us.debian.org/debian/pool/main/g/google-perftools/libtcmalloc-minimal4_2.2.1-0.2_amd64.deb && \
    # dpkg -i /tmp/libtcmalloc-minimal4_2.2.1-0.2_amd64.deb && \
    # rm /tmp/libtcmalloc-minimal4_2.2.1-0.2_amd64.deb && \
    # #libpng12
    # wget -q -O /tmp/libpng12.deb http://mirrors.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb && \
    # dpkg -i /tmp/libpng12.deb && \
    # rm /tmp/libpng12.deb && \
    # wget -q -O /tmp/libpng12.deb http://mirrors.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_i386.deb && \
    # dpkg -i /tmp/libpng12.deb && \
    # rm /tmp/libpng12.deb && \
    apt-get install -y cadaver owncloud-client-cmd && \       
    #apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p /var/run/sshd && \
    install -d -g root -m 0700 -o root /root/.ssh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]
