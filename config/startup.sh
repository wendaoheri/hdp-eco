#/bin/bash

/usr/sbin/sshd

start-dfs.sh
start-yarn.sh

nohup hive --service metastore > /dev/null 2>&1 &

nohup hiveserver2 > /dev/null 2>&1 &