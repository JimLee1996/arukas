#!/bin/bash

#######################
#					  #
#	Arukas Api Tool	  #
#					  #
#	   Jim Lee		  #
#    				  #
#######################

# Authorization
token=9637690d-f5e2-47e3-ab41-a63cb2eb27c9
secret=o6Io7gs7rZZX8nXzxphvtwhwZcFH9Jt9kd4b16ePlbkeJqNXJME15mnKpqQ8P1tJ

data=`curl --user ${token}:${secret} https://app.arukas.io/api/containers -H "Content-Type: application/vnd.api+json" -H "Accept: application/vnd.api+json"`

# Resolve Json
host=`echo $data | sed 's/.*"host":\([^,}]*\).*/\1/' | sed 's/\"//g'`
port=`echo $data | sed 's/.*"service_port":\([^,}]*\).*/\1/'`

cmd='/root/kcptun -l :8388 -r '${host}:${port}' -key "kcptun" -crypt salsa20 -mode fast2'

# Reconfig Supervisor
function config(){
	cat > /etc/supervisor/conf.d/kcptun.conf<<-EOF
[program:kcptun]
command=${cmd}
user=root
autostart=true
autorestart=true
EOF
}

# Save new data
function save(){
	cat > ./kcptun.dat<<-EOF
${port}
EOF
}

if [ -f "./kcptun.dat" ];then
	oldport=`sed -n '1p' ./kcptun.dat`
else
	oldport=0
fi

if [ "$port" != "$oldport" ];then
	config
	save
	supervisorctl update
fi

