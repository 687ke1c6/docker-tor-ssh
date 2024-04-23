#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

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
        docker logs -f ssh-tor
    ;;
    onion )
        docker exec -t ssh-tor cat /var/lib/tor/torssh/hostname
    ;;
esac