#/bin/bash
CONTAINER_ALREADY_STARTED="CONTAINER_ALREADY_STARTED_PLACEHOLDER"
if [ ! -e $CONTAINER_ALREADY_STARTED ]; then
    touch $CONTAINER_ALREADY_STARTED
    echo "-- First container startup --"
    su -c "/wait-for-it.sh mysql:3306 --timeout=30 --strict -- schematool -dbType mysql -initSchema" hive
    su -c "/wait-for-it.sh hadoop:8020 --timeout=30 --strict -- hdfs dfs -mkdir /tmp" hive
    su -c "/wait-for-it.sh hadoop:8020 --timeout=30 --strict -- hdfs dfs -mkdir /user/hive/warehouse" hive
    su -c "/wait-for-it.sh hadoop:8020 --timeout=30 --strict -- hdfs dfs -chmod g+w /tmp" hive
    su -c "/wait-for-it.sh hadoop:8020 --timeout=30 --strict -- hdfs dfs -chmod g+w /user/hive/warehouse" hive
else
    echo "-- Not first container startup --"
fi

supervisord -c /etc/supervisord.conf