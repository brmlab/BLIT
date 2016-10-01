#!/bin/bash

IFACE_DEFAULT="$(/usr/local/bin/netiface-default.py)"
DATE="$(date +%Y-%m-%d--%H:%M)"
LOGFILE="/home/LEAKS/wifi/arp-scan/${DATE}-${IFACE_DEFAULT}.log"

/usr/bin/arp-scan --interface=${IFACE_DEFAULT} --localnet|tee "${LOGFILE}"
