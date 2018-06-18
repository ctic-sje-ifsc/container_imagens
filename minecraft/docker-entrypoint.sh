#!/bin/sh

set -e


if [ "${MC_DIR}" = "" ]
then
    MC_DIR="/minecraft"
fi

if [ "${MC_VERSION}" = "" ]
then
    MC_VERSION="1.12.2"
fi

URL="https://s3.amazonaws.com/Minecraft.Download/versions/${MC_VERSION}/minecraft_server.${MC_VERSION}.jar"

if ! [ -f "${HOME}/server.jar" ]
then
    curl --retry 3 -v ${URL} -o ${HOME}/server.jar -o ${HOME}/server.jar
fi

cat > ${HOME}/eula.txt <<EOF
eula=true
EOF

exec "$@"
