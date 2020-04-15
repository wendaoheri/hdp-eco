FROM registry.cn-hangzhou.aliyuncs.com/hdp-eco/hdp-eco-base

RUN groupadd hadoop
RUN useradd -d /home/hadoop -m -g hadoop hadoop

RUN wget -q https://downloads.apache.org/hadoop/common/hadoop-2.10.0/hadoop-2.10.0.tar.gz && \
    tar -xf hadoop-2.10.0.tar.gz -C /usr/lib && \
    rm -rf hadoop-2.10.0.tar.gz && \
    ln -s /usr/lib/hadoop-2.10.0 /usr/lib/hadoop && \
    chown -R hadoop:hadoop /usr/lib/hadoop

ENV HADOOP_HOME /usr/lib/hadoop
ENV PATH ${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin:${PATH}

COPY --chown=hadoop:hadoop config/* ${HADOOP_HOME}/etc/hadoop/

RUN useradd -d /home/hdfs -m -g hadoop hdfs
RUN useradd -d /home/yarn -m -g hadoop yarn


RUN mkdir -p /var/hadoop/dfs/name && \ 
   mkdir -p /var/hadoop/dfs/data && \
   mkdir -p /var/hadoop/dfs/namesecondary && \
   chown -R hdfs:hadoop /var/hadoop/dfs/name /var/hadoop/dfs/data /var/hadoop/dfs/namesecondary

USER hdfs

RUN hdfs namenode -format