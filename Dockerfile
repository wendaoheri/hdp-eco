FROM registry.cn-hangzhou.aliyuncs.com/hdp-eco/hdp-eco-base:latest

USER root

ADD config/startup.sh /

RUN chmod +x startup.sh

ADD config/other/bashrc /etc/

ENV JAVA_HOME /opt/jdk
ENV SCALA_HOME /opt/scala
ENV M2_HOME /opt/maven
ENV CLASSPATH .:${JAVA_HOME}/lib:${JAVA_HOME}/lib/tools.jar
ENV HADOOP_HOME /opt/hadoop
ENV HADOOP_CONF_DIR ${HADOOP_HOME}/etc/hadoop
ENV HIVE_HOME /opt/hive
ENV HBASE_HOME /opt/hbase
ENV SPARK_HOME /opt/spark
ENV KAFKA_HOME /opt/kafka
ENV ZOOKEEPER_HOME /opt/zookeeper
ENV PATH ${JAVA_HOME}/bin:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin:${SCALA_HOME}/bin:${HIVE_HOME}/bin:${HBASE_HOME}/bin:${KAFKA_HOME}/bin:${ZOOKEEPER_HOME}/bin:${M2_HOME}/bin:${PATH}

ADD config/hadoop/* $HADOOP_HOME/etc/hadoop/
ADD config/hive/* $HIVE_HOME/conf/
ADD config/hbase/* ${HBASE_HOME}/conf/
ADD config/spark/* ${SPARK_HOME}}/conf/
ADD config/kafka/* ${KAFKA_HOME}/conf/

RUN mkdir -p /var/hadoop/dfs/name && \ 
   mkdir -p /var/hadoop/dfs/data && \
   mkdir -p /var/hadoop/dfs/namesecondary && \
   $HADOOP_HOME/bin/hdfs namenode -format

# ssh
EXPOSE 22
# haoop
EXPOSE 50070 8088 9000

CMD [ "sh", "-c", "/startup.sh; bash"]