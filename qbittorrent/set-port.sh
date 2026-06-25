#!/bin/sh

# Read forwarded port from Gluetun
PORT=$(cat /gluetun-tmp/forwarded_port)
echo "Using forwarded port: $PORT"

CONF="/config/qBittorrent/qBittorrent.conf"

# Ensure config file exists
if [ ! -f "$CONF" ]; then
    echo "Config file not found at $CONF"
    exit 1
fi

# Update the listening port in the config
# This replaces the existing Session\Port=xxxxx line
sed -i "s/^Session\\Port=.*/Session\\Port=$PORT/" "$CONF"

# Hand control back to the container's original entrypoint
# (LinuxServer.io uses /init, but if your image uses something else,
#  this will be replaced by the command override in compose)
exec "$@"
