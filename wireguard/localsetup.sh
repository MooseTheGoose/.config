#!/bin/sh

WGIF="wg0"
PRIVKEY="/root/private"
PUBKEY="/root/public"

if [ "$2" = "" ] ; then
	echo "Usage: $0 <PeerCIDR> <MasqIF>"
	exit 1
fi
WGIP="$1"
INETIF="$2"
WGPORT="41211"

umask 077
mkdir -p /root || exit
if [ ! -f "$PRIVKEY" ] ; then
	wg genkey >"$PRIVKEY"
	wg pubkey <"$PRIVKEY" >"$PUBKEY"
fi

ip link add "$WGIF" type wireguard
ip addr add "$WGIP" dev "$WGIF" 
wg set "$WGIF" listen-port "$WGPORT" private-key "$PRIVKEY"
ip link set "$WGIF" up

iptables -D FORWARD -i wg0 -j ACCEPT
iptables -t nat -D POSTROUTING -o "$INETIF" -j MASQUERADE
iptables -I FORWARD -i wg0 -j ACCEPT
iptables -t nat -I POSTROUTING -o "$INETIF" -j MASQUERADE
ufw allow "$WGPORT"/udp

echo "WG Local Setup done!"
echo  "External IP:" `curl ifconfig.so`
