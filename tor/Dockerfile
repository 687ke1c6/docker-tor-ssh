FROM    debian:bookworm-slim

RUN     set -ex && \
        apt-get update && \
        apt-get upgrade -y && \
        apt-get install -y tor ssh

COPY    ./restart.sh /restart.sh

RUN     chmod ug+x /restart.sh

USER    debian-tor
