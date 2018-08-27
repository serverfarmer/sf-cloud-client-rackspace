#!/bin/sh

if [ "$2" = "" ]; then
	echo "usage: $0 <cloud-account> <ssh-key-name>"
	exit 1
elif [ ! -f /etc/local/.cloud/rackspace/$1.sh ]; then
	echo "error: cloud account \"$1\" not configured"
	exit 1
fi

account=$1
name=$2
key=/etc/local/.ssh/id_rack_$name

if [ -f $name ] || [ -f $key ]; then
	echo "warning: ssh key $key already exists"
	exit 0
fi

ssh-keygen -q -t rsa -f $key -b 4096 -N ""

public="`cat $key.pub`"
/opt/farm/ext/cloud-client-rackspace/support/rack servers keypair upload \
	--name $name \
	--public-key "$public" \
	--profile $account
