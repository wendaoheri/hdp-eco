FROM registry.cn-hangzhou.aliyuncs.com/hdp-eco/hdp-eco-base

RUN groupadd hadoop
RUN useradd -d /home/hadoop -m -g hadoop hadoop

ENV HADOOP_VERSION 2.10.0

RUN wget -q https://archive.apache.org/dist/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz && \
    tar -xf hadoop-${HADOOP_VERSION}.tar.gz -C /usr/lib && \
    rm -rf hadoop-${HADOOP_VERSION}.tar.gz && \
    ln -s /usr/lib/hadoop-${HADOOP_VERSION} /usr/lib/hadoop && \
    chown -R hadoop:hadoop /usr/lib/hadoop /usr/lib/hadoop-${HADOOP_VERSION} && \
    rm -rf /usr/lib/hadoop/share/doc

ENV HADOOP_HOME /usr/lib/hadoop
ENV PATH ${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin:${PATH}

COPY config/* ${HADOOP_HOME}/etc/hadoop/
COPY bin/* ${HADOOP_HOME}/bin/
COPY sbin/* ${HADOOP_HOME}/sbin/

RUN chown -R hadoop:hadoop ${HADOOP_HOME}/etc/hadoop/
RUN chown -R hadoop:hadoop ${HADOOP_HOME}/bin/
RUN chown -R hadoop:hadoop ${HADOOP_HOME}/sbin/

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

EXPOSE 8020 8088 50070 50075

ENTRYPOINT [ "supervisord", "-c" , "/etc/supervisord.conf" ]
