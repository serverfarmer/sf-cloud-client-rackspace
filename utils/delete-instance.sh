#!/bin/sh

if [ "$2" = "" ]; then
	echo "usage: $0 <cloud-account> <instance-id>"
	exit 1
fi

account=$1
instance=$2

/opt/farm/ext/cloud-client-rackspace/support/rack servers instance delete \
	--id $instance \
	--profile $account
