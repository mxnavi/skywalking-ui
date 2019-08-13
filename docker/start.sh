#!/bin/bash
. /etc/profile
mx-mesos-ssh

#判断是否存在mx-config阿波罗环境变量
if [ -n "$MXPROJECT" ] && [ -n "$MXENV" ] && [ -n "$MXCLUSTER" ];
   then
    export mxproject=$MXPROJECT
    export mxenv=$MXENV
    export mxcluster=$MXCLUSTER
    /bin/mx-config
fi

sed -i "s/SERVERHOSTNAME/"$collector_ribbon_listOfServers"/g" /etc/nginx/sites-enabled/mx-nginx.conf

/usr/sbin/nginx -c /etc/nginx/nginx.conf -g 'daemon off;'
