#!/bin/sh

if [ "$2" = "" ] ; then
	echo "Usage: $0 <PubKey> <AllowedCIDR> <EndPoint>"
	exit 1
fi

WGIF="wg0"
PUBKEY="$1"
ALLOWED="$2"

ENDPTARG=""
if [ "$3" != "" ] ; then
	ENDPTARG="endpoint $3"
fi

wg set "$WGIF" peer "$PUBKEY" allowed-ips "$ALLOWED" $ENDPTARG
echo "Peer addition done!"
