#!/bin/sh
set -e

# Port is fixed at 3000 — this must match the Target Port you enter in
# Railway → Settings → Networking → Generate Domain.
cp /etc/nginx/http.d/default.conf.template /etc/nginx/http.d/default.conf

# Start the original 3x-ui panel + xray process in the background.
# NOTE: verify this path in your Railway build logs — if the container
# fails to boot, check the log line that shows what command actually
# starts the panel, and update this line to match.
/app/DockerEntrypoint.sh &

sleep 5

exec nginx -g "daemon off;"
