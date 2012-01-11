#!/bin/bash

###############################
# Site Checker by Scott Pustay
# Version 1b - April 21, 2011
#
# inputs:	website URL
#
# usage:
#	./site_check.sh scottpustay.com
#
# Will return if the site is up or down.
#
###############################

case $1 in
\-h|\-\-help|\-\?)
	echo "usage: ./site_check.sh sitename.tld"
	exit
esac

site=`curl -sLI $1 | grep Server`

if [ $? = 1 ]; then

	echo "NOOOOOOOO ${1} is not responding to http requests on port 80"
	exit

fi

server=`echo $site | awk '{print $2}' | tr -d "\r"`

echo "${server} server is running on ${1}"

exit
