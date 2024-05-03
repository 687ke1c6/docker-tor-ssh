FROM    debian:bookworm-slim

RUN     set -ex && \
        apt-get update && \
        apt-get upgrade -y && \
        apt-get install -y apt-transport-https wget pgp lsb-release

RUN     VER=$(lsb_release -sc) && \
        echo "deb       [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org $VER main" > /etc/apt/sources.list.d/tor.list && \
        echo "deb-src   [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org $VER main" >> /etc/apt/sources.list.d/tor.list && \
        wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --dearmor | tee /usr/share/keyrings/tor-archive-keyring.gpg >/dev/null && \
        apt update && apt install tor deb.torproject.org-keyring -y

COPY    --chmod=750 --chown=debian-tor:debian-tor ./restart.sh /restart.sh


USER    debian-tor
