FROM registry.cn-hangzhou.aliyuncs.com/hdp-eco/hdp-eco-base

USER root

RUN yum install -y hadoop-hdfs-namenode hadoop-hdfs-secondarynamenode hadoop-hdfs-datanode hadoop-httpfs hadoop-yarn-resourcemanager hadoop-yarn-nodemanager hadoop-mapreduce-historyserver

ADD config /etc/hadoop/conf.my_cluster

RUN alternatives --install /etc/hadoop/conf hadoop-conf /etc/hadoop/conf.my_cluster 50 && \
    alternatives --set hadoop-conf /etc/hadoop/conf.my_cluster