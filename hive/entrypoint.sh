#/bin/bash
CONTAINER_ALREADY_STARTED="CONTAINER_ALREADY_STARTED_PLACEHOLDER"
if [ ! -e $CONTAINER_ALREADY_STARTED ]; then
    touch $CONTAINER_ALREADY_STARTED
    echo "-- First container startup --"
    su -c "schematool -dbType mysql -initSchema" hive
    su -c "hdfs dfs -mkdir /tmp" hive
    su -c "hdfs dfs -mkdir /user/hive/warehouse" hive
    su -c "hdfs dfs -chmod g+w /tmp" hive
    su -c "hdfs dfs -chmod g+w /user/hive/warehouse" hive
else
    echo "-- Not first container startup --"
fi

supervisord -c /etc/supervisord.conf