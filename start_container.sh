docker run --rm -it --name hdp-eco --link mysql --privileged \
-p 10000:10000/tcp -p 1099:1099/tcp -p 1992:1992/tcp \
-p 19999:19999/tcp -p 22:22/tcp -p 30000:30000/tcp \
-p 5007:50070/tcp -p 8088:8088/tcp -p 9000:9000/tcp -p 9083:9083/tcp \
-p 9001:9001 \
registry.cn-hangzhou.aliyuncs.com/hdp-eco/hdp-eco:latest