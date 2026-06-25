#!/bin/sh

PORT=$(cat /gluetun-tmp/forwarded_port)
echo "Using forwarded port: $PORT"

CONF="/config/qBittorrent/qBittorrent.conf"

sed -i "s/^Session\\Port=.*/Session\\Port=$PORT/" "$CONF"
