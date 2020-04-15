FROM registry.cn-hangzhou.aliyuncs.com/hdp-eco/hdp-eco-base

RUN groupadd hadoop
RUN useradd -d /home/hadoop -m -g hadoop hadoop

RUN wget -q https://downloads.apache.org/hadoop/common/hadoop-2.10.0/hadoop-2.10.0.tar.gz && \
    tar -xf hadoop-2.10.0.tar.gz -C /usr/lib && \
    rm -rf hadoop-2.10.0.tar.gz && \
    ln -s /usr/lib/hadoop-2.10.0 /usr/lib/hadoop && \
    chown -R hadoop:hadoop /usr/lib/hadoop

USER hadoop