#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo started tor for ssh/http

# echo "## Set permissions on /var/lib/tor dir ###"
# chmod 750 /var/lib/tor

echo "## Starting tor #############################"

tor_options=(
  --SocksPort 127.0.0.1:9050
  # --SocksPolicy "accept 192.168.0.0/24"
  # --SocksPolicy "reject *"
  # --DataDirectory /var/lib/tor/.tor
  --DataDirectoryGroupReadable 1
  --HiddenServiceDir /var/lib/tor/torssh2
  --HiddenServicePort "22 127.0.0.1:22"
  # --HiddenServiceDir /var/lib/tor/http
  # --HiddenServicePort "80 127.0.0.1:80"
)

exec tor "${tor_options[@]}"