FROM registry.cn-hangzhou.aliyuncs.com/hdp-eco/hive

ENV HBASE_VERSION 1.6.0

RUN useradd -d /home/hbase -m -g hadoop hbase

WORKDIR /root

RUN wget -q https://archive.apache.org/dist/hbase/${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz && \
    tar -xf hbase-${HBASE_VERSION}-bin.tar.gz -C /usr/lib 
    # rm -rf hbase-${HBASE_VERSION}-bin.tar.gz && \
    # ln -s /usr/lib/hbase-${HBASE_VERSION}-bin /usr/lib/hbase && \
    # chown -R hadoop:hadoop /usr/lib/hbase-${HBASE_VERSION}-bin /usr/lib/hbase

# ENV KYLIN_HOME /usr/lib/kylin
# ENV PATH ${KYLIN_HOME}/bin:${PATH}


# COPY conf/* ${KYLIN_HOME}/conf/
# COPY bin/* ${KYLIN_HOME}/bin/
# COPY sample_cube/* ${KYLIN_HOME}/sample_cube