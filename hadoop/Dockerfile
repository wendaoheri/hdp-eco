FROM registry.cn-hangzhou.aliyuncs.com/hdp-eco/hdp-eco-base

RUN groupadd hadoop
RUN useradd -d /home/hadoop -m -g hadoop hadoop

RUN wget -q https://apache.mirrors.lucidnetworks.net/hadoop/common/hadoop-2.10.0/hadoop-2.10.0.tar.gz && \
    tar -xf hadoop-2.10.0.tar.gz -C /usr/lib && \
    rm -rf hadoop-2.10.0.tar.gz && \
    ln -s /usr/lib/hadoop-2.10.0 /usr/lib/hadoop && \
    chown -R hadoop:hadoop /usr/lib/hadoop /usr/lib/hadoop-2.10.0

ENV HADOOP_HOME /usr/lib/hadoop
ENV PATH ${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin:${PATH}

COPY config/* ${HADOOP_HOME}/etc/hadoop/

RUN chown -R hadoop:hadoop ${HADOOP_HOME}/etc/hadoop/

RUN useradd -d /home/hdfs -m -g hadoop hdfs
RUN useradd -d /home/yarn -m -g hadoop yarn


RUN mkdir -p /var/hadoop/dfs/name && \ 
   mkdir -p /var/hadoop/dfs/data && \
   mkdir -p /var/hadoop/dfs/snn && \
   mkdir -p /var/log/hadoop-hdfs && \
   chown -R hdfs:hadoop /var/hadoop/dfs/name /var/hadoop/dfs/data /var/hadoop/dfs/snn /var/log/hadoop-hdfs

USER hdfs

RUN hdfs namenode -format

USER root

RUN mkdir -p /var/log/hadoop-yarn && \
    chown -R yarn:hadoop /var/log/hadoop-yarn

COPY supervisor.d/* /etc/supervisor.d/

EXPOSE 8020 8888 50070

ENTRYPOINT [ "supervisord", "-c" , "/etc/supervisord.conf" ]
