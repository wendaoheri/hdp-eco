FROM registry.cn-hangzhou.aliyuncs.com/hdp-eco/hdp-eco-base

ENV KAFKA_VERSION 2.5.0

RUN groupadd hadoop
RUN useradd -d /home/kafka -m -g hadoop kafka

RUN wget -q https://downloads.apache.org/kafka/${KAFKA_VERSION}/kafka_2.12-${KAFKA_VERSION}.tgz && \
    tar -xf kafka_2.12-${KAFKA_VERSION}.tgz -C /usr/lib && \
    rm -rf kafka_2.12-${KAFKA_VERSION}.tgz && \
    ln -s /usr/lib/kafka_2.12-${KAFKA_VERSION} /usr/lib/kafka && \
    chown -R kafka:hadoop /usr/lib/kafka /usr/lib/kafka_2.12-${KAFKA_VERSION}

ENV KAFKA_HOME /usr/lib/kafka
ENV PATH ${KAFKA_HOME}/bin:${PATH}

COPY config/* ${KAFKA_HOME}/config/
COPY bin/* ${KAFKA_HOME}/bin/

RUN chown -R kafka:hadoop ${KAFKA_HOME}/config/ ${KAFKA_HOME}/bin/ && \
    chmod 775  -R ${KAFKA_HOME}/bin/ ${KAFKA_HOME}/config/

COPY supervisor.d/* /etc/supervisor.d/

RUN mkdir -p /var/log/kafka /var/kafka-logs /var/log/zookeeper /var/zookeeper && \
    chown -R kafka:hadoop /var/log/kafka /var/kafka-logs /var/log/zookeeper /var/zookeeper