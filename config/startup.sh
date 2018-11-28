#/bin/bash

/usr/sbin/sshd

mkdir -p /var/log/hadoop-hdfs
mkdir -p /var/log/hadoop-yarn

supervisord -c supervisord.conf