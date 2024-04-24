#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

source .env

case $1 in
    build )
        shift
        eval "docker compose build $@"
    ;;
    stop | down )
        docker compose down
    ;;
    start | up )
        docker compose up -d
    ;;
    logs )
        docker logs -f "$CONTAINER_NAME"
    ;;
    onion )
        docker exec -t "$CONTAINER_NAME" cat /var/lib/tor/torssh/hostname
    ;;
esac