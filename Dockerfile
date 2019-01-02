FROM registry.cn-hangzhou.aliyuncs.com/hdp-eco/hdp-eco-base:1.0

USER root

ADD config/startup.sh /

RUN chmod +x startup.sh

ADD config/other/bashrc /etc/

ADD config/other/supervisord.conf /
ADD config/other/supervisor.d/ /supervisor.d/

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
ENV ALLUXIO_HOME /opt/alluxio
ENV FLINK_HOME /opt/flink
ENV ACTIVATOR_HOME /opt/activator
ENV PATH ${ACTIVATOR_HOME}/bin:${JAVA_HOME}/bin:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin:${SCALA_HOME}/bin:${HIVE_HOME}/bin:${HBASE_HOME}/bin:${KAFKA_HOME}/bin:${ZOOKEEPER_HOME}/bin:${M2_HOME}/bin:${ALLUXIO_HOME}/bin:${FLINK_HOME}/bin:${PATH}

ADD config/hadoop/* $HADOOP_HOME/etc/hadoop/
ADD config/hive/* $HIVE_HOME/conf/
ADD config/hbase/* ${HBASE_HOME}/conf/
ADD config/spark/* ${SPARK_HOME}/conf/
ADD config/kafka/* ${KAFKA_HOME}/conf/
ADD config/alluxio/* ${ALLUXIO_HOME}/conf/
ADD config/flink/* ${FLINK_HOME}/conf/
ADD config/dr-elephant/compile.conf /

RUN mkdir -p /var/hadoop/dfs/name && \ 
   mkdir -p /var/hadoop/dfs/data && \
   mkdir -p /var/hadoop/dfs/namesecondary && \
   $HADOOP_HOME/bin/hdfs namenode -format

# download mysql driver
RUN wget -O mysql-connector-java.jar https://search.maven.org/remotecontent\?filepath\=mysql/mysql-connector-java/8.0.13/mysql-connector-java-8.0.13.jar

# link mysql driver to hive lib
RUN ln -s /mysql-connector-java.jar ${HIVE_HOME}/lib/mysql-connector-java.jar

RUN alluxio format

# install dr.elephant
RUN git clone https://github.com/linkedin/dr-elephant.git 

# ssh
EXPOSE 22
# haoop
EXPOSE 50070 8088 9000
# hive
EXPOSE 9083 10000
# JSTATD JMX
EXPOSE 1099 1992
# alluxio
EXPOSE 19999 30000
# flink
EXPOSE 8081
# supervisor
EXPOSE 9001

CMD [ "sh", "-c", "/startup.sh; bash"]