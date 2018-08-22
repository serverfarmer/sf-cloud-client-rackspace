#!/bin/sh

if [ "$1" = "" ]; then
	echo "usage: $0 <cloud-account> [--full]"
	exit 1
fi

account=$1

if [ "$2" != "--full" ]; then
	/opt/farm/ext/cloud-client-rackspace/support/rack servers flavor list --profile $account |grep -v ^ID |cut -f1
else
	/opt/farm/ext/cloud-client-rackspace/support/rack servers flavor list --profile $account
fi
