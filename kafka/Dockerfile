FROM registry.cn-hangzhou.aliyuncs.com/hdp-eco/hdp-eco-base

RUN groupadd hadoop
RUN useradd -d /home/kafka -m -g hadoop kafka

RUN wget -q https://downloads.apache.org/kafka/2.5.0/kafka_2.12-2.5.0.tgz && \
    tar -xf kafka_2.12-2.5.0.tgz -C /usr/lib && \
    rm -rf kafka_2.12-2.5.0.tgz && \
    ln -s /usr/lib/kafka_2.12-2.5.0 /usr/lib/kafka && \
    chown -R kafka:hadoop /usr/lib/kafka /usr/lib/kafka_2.12-2.5.0