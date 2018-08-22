#!/bin/sh

if [ "$3" = "" ]; then
	echo "usage: $0 <cloud-account> <instance-id> <new-instance-type>"
	exit 1
fi

account=$1
instance=$2
type=$3

/opt/farm/ext/cloud-client-rackspace/support/rack servers instance resize \
	--id $instance \
	--flavor-id $type \
	--profile $account
