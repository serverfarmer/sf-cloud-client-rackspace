#!/bin/sh

if [ "$1" = "" ]; then
	echo "usage: $0 <cloud-account>"
	exit 1
fi

account=$1
/opt/farm/ext/cloud-client-rackspace/support/rack servers image list \
	--profile $account \
	--output csv \
	|cut -d, -f2 |grep -v ^Name |sort
