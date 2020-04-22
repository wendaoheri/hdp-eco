#/bin/bash

su hive
CONTAINER_ALREADY_STARTED="CONTAINER_ALREADY_STARTED_PLACEHOLDER"
if [ ! -e $CONTAINER_ALREADY_STARTED ]; then
    touch $CONTAINER_ALREADY_STARTED
    echo "-- First container startup --"
    schematool -dbType mysql -initSchema
    hdfs dfs -mkdir         /tmp
    hdfs dfs -mkdir         /user/hive/warehouse
    hdfs dfs -chmod g+w     /tmp
    hdfs dfs -chmod g+w     /user/hive/warehouse
else
    echo "-- Not first container startup --"
fi
exit

supervisord -c /etc/supervisord.conf