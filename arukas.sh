#!/bin/sh

#######################
#                     #
#   Arukas Api Tool   #
#                     #
#   Jim Lee  2017.1   #
#                     #
#######################

# Authorization
token=
secret=

data=`curl --user ${token}:${secret} https://app.arukas.io/api/containers -H "Content-Type: application/vnd.api+json" -H "Accept: application/vnd.api+json"`

# Resolve Json
host=`echo $data | sed 's/.*"host":\([^,}]*\).*/\1/'`
port=`echo $data | sed 's/.*"service_port":\([^,}]*\).*/\1/'`

echo $host
echo $port
