FROM registry.cn-hangzhou.aliyuncs.com/hdp-eco/spark

ENV KYLIN_VERSION 2.6.6

RUN useradd -d /home/kylin -m -g hadoop kylin

WORKDIR /root

RUN wget -q https://archive.apache.org/dist/kylin//apache-kylin-${KYLIN_VERSION}/apache-kylin-${KYLIN_VERSION}-bin-hbase1x.tar.gz && \
    tar -xf apache-kylin-${KYLIN_VERSION}-bin-hbase1x.tar.gz -C /usr/lib && \
    rm -rf apache-hive-${HIVE_VERSION}-bin.tar.gz && \
    ln -s /usr/lib/apache-kylin-${KYLIN_VERSION}-bin-hbase1x /usr/lib/kylin && \
    chown -R hadoop:hadoop /usr/lib/apache-kylin-${KYLIN_VERSION}-bin-hbase1x /usr/lib/hive