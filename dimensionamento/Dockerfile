FROM nginx:stable

ARG BUILD_DATE
ARG VCS_REF
# LABEL maintainer="ctic.sje@listas.sj.ifsc.edu.br" \
#     org.label-schema.build-date=$BUILD_DATE \
#     org.label-schema.name="CTIC-SJE-IFSC Kubernetes: MRBS" \
#     org.label-schema.description="Nuvem privada do Câmpus São José do IFSC" \
#     org.label-schema.license="MIT" \
#     org.label-schema.url="https://projetos.sj.ifsc.edu.br" \
#     org.label-schema.vcs-ref=$VCS_REF \
#     org.label-schema.vcs-url="https://github.com/ctic-sje-ifsc/servicos_kubernetes" \
#     org.label-schema.vendor="CTIC" \
#     org.label-schema.version="1.7.5" \
#     org.label-schema.schema-version="1.0"

COPY IFSC.png /usr/share/nginx/html
COPY layout.html /usr/share/nginx/html/index.html

EXPOSE 80/TCP