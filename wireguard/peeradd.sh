#!/bin/sh

if [ "$3" = "" ] ; then
	echo "Usage: $0 <PubKey> <AllowedCIDR> <EndPoint>"
	exit 1
fi

WGIF="wg0"
PUBKEY="$1"
ALLOWED="$2"
ENDPOINT="$3"

wg set "$WGIF" peer "$PUBKEY" allowed-ips "$ALLOWED" endpoint "$ENDPOINT"
echo "Peer addition done!"
