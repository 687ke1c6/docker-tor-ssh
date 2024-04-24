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
        docker compose logs -f tor
    ;;
    onion )
        docker compose exec -t tor cat /var/lib/tor/torssh/hostname
    ;;
esac