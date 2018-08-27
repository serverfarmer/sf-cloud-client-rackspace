#!/bin/sh

if [ "$1" = "" ]; then
	echo "usage: $0 <cloud-account>"
	exit 1
elif [ ! -f /etc/local/.cloud/rackspace/$1.sh ]; then
	echo "error: cloud account \"$1\" not configured"
	exit 1
fi

account=$1
/opt/farm/ext/cloud-client-rackspace/support/rack servers keypair list --profile $account |grep -v ^Name |cut -f1
