#!/bin/sh
PORT=$(cat /gluetun-tmp/forwarded_port)
echo "Using forwarded port: $PORT"
qbittorrent-nox --profile=/config --torrenting-port=$PORT
