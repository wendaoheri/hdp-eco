FROM registry.cn-hangzhou.aliyuncs.com/hdp-eco/hadoop

RUN wget -q https://apache.mirrors.lucidnetworks.net/hive/hive-2.3.7/apache-hive-2.3.7-bin.tar.gz && \
    tar -xf apache-hive-2.3.7-bin.tar.gz -C /usr/lib && \
    rm -rf apache-hive-2.3.7-bin.tar.gz && \
    ln -s /usr/lib/apache-hive-2.3.7-bin /usr/lib/hive && \
    chown -R hadoop:hadoop /usr/lib/apache-hive-2.3.7-bin /usr/lib/hive