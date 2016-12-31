#!/bin/sh

#######################
#                     #
#   Arukas Api Tool   #
#                     #
#   Jim Lee  2017.1   #
#                     #
#######################

# Authorization
token=9637690d-f5e2-47e3-ab41-a63cb2eb27c9
secret=o6Io7gs7rZZX8nXzxphvtwhwZcFH9Jt9kd4b16ePlbkeJqNXJME15mnKpqQ8P1tJ

data=`curl --user ${token}:${secret} https://app.arukas.io/api/containers -H "Content-Type: application/vnd.api+json" -H "Accept: application/vnd.api+json"`

# Resolve Json
host=`echo $data | sed 's/.*"host":\([^,}]*\).*/\1/'`
port=`echo $data | sed 's/.*"service_port":\([^,}]*\).*/\1/'`

echo $host
echo $port