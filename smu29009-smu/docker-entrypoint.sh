#!/bin/sh

set -e

sh -c '/bin/sed -i "s/localhost/etherpad.sj.ifsc.edu.br/g" /video-conference-webrtc/server.js'

exec "$@"