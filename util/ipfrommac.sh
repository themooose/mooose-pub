#!/bin/bash
[ -z "$1" ] && echo "Empty"
THISNET=ifconfig | grep 'inet.*broadcast' | awk '{print $6}' | sed 's/255/0/g'
TARGETIP=nmap -sP "{$THISNET}/24" >/dev/null && arp -an | grep "$1" | awk '{print $2}' | sed 's/[()]//g'
echo $TARGETIP


# MACs for reference
ooopi-mac="dc:a6:32:a6:59:80"
rpizero-mac="14:bb:6e:7a:d1:44"
mbprooo-mac="f4:5c:89:90:54:57"
ooopieth-mac="b8:27:eb:4b:53:cb"
mbpcm-mac="e8:ea:6a:5f:16:23"
ipadcm-mac="192.168.86.245"

# Find them all...
# arp -a | awk '!/\?/'