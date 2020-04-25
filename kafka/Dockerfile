FROM registry.cn-hangzhou.aliyuncs.com/hdp-eco/hdp-eco-base

RUN groupadd hadoop
RUN useradd -d /home/kafka -m -g hadoop kafka

RUN wget -q https://downloads.apache.org/kafka/2.5.0/kafka_2.12-2.5.0.tgz && \
    tar -xf kafka_2.12-2.5.0.tgz -C /usr/lib && \
    rm -rf kafka_2.12-2.5.0.tgz && \
    ln -s /usr/lib/kafka_2.12-2.5.0 /usr/lib/kafka && \
    chown -R kafka:hadoop /usr/lib/kafka /usr/lib/kafka_2.12-2.5.0

ENV KAFKA_HOME /usr/lib/kafka
ENV PATH ${KAFKA_HOME}/bin:${PATH}

COPY config/* ${KAFKA_HOME}/config/
COPY bin/* ${KAFKA_HOME}/bin/

RUN chown -R kafka:hadoop ${KAFKA_HOME}/config/
RUN chown -R kafka:hadoop ${KAFKA_HOME}/bin/

COPY supervisor.d/* /etc/supervisor.d/

RUN mkdir -p /var/log/kafka /var/kafka-logs /var/log/zookeeper /var/zookeeper && \
    chown -R kafka:hadoop /var/log/kafka /var/kafka-logs /var/log/zookeeper /var/zookeeper