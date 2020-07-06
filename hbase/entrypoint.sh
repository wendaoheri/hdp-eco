#/bin/bash
CONTAINER_ALREADY_STARTED="CONTAINER_ALREADY_STARTED_PLACEHOLDER"
if [ ! -e $CONTAINER_ALREADY_STARTED ]; then
    touch $CONTAINER_ALREADY_STARTED
    echo "-- First container startup --"
    su -c "/wait-for-it.sh hadoop:8020 --timeout=30 --strict -- hdfs dfs -mkdir -p /hbase" hbase
    su -c "/wait-for-it.sh hadoop:8020 --timeout=30 --strict -- hdfs dfs -chmod -R 775 /hbase" hbase
else
    echo "-- Not first container startup --"
fi

supervisord -c /etc/supervisord.conf