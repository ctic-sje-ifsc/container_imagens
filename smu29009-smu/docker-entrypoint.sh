#!/bin/sh

set -e

sh -c '/bin/sed -i "s/localhost/etherpad.sj.ifsc.edu.br/g" /usr/src/app/video-conference-webrtc/server.js'
sh -c '/bin/sed -i "s/127.0.0.1/etherpad.sj.ifsc.edu.br/g" /usr/src/app/video-conference-webrtc/server.js'


exec "$@"