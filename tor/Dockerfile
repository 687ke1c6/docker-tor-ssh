FROM    debian:bookworm-slim

RUN     set -ex && \
        apt-get update && \
        apt-get upgrade -y && \
        apt-get install -y tor ssh

COPY    --chmod=750     --chown=debian-tor:debian-tor     ./restart.sh /restart.sh

USER    debian-tor
