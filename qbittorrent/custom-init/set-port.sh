#!/bin/sh

PORT=$(cat /gluetun-tmp/forwarded_port)
echo "Using forwarded port: $PORT"

CONF="/config/qBittorrent/qBittorrent.conf"

# Double check that the config file actually exists before running sed
if [ -f "$CONF" ]; then
    # Match the literal backslash and replace the port
    sed -i 's/^Session\\Port=.*/Session\\Port='$PORT'/' "$CONF"
    echo "Successfully updated qBittorrent config port to $PORT"
else
    echo "Error: Configuration file not found at $CONF"
fi