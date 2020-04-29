FROM registry.cn-hangzhou.aliyuncs.com/hdp-eco/hive

ENV FLINK_VERSION 1.10.0
ENV SCALA_VERSION 2.11

RUN useradd -d /home/flink -m -g hadoop flink

RUN wget -q https://archive.apache.org/dist/flink/flink-${FLINK_VERSION}/flink-${FLINK_VERSION}-bin-scala_${SCALA_VERSION}.tgz && \
    tar -xf flink-${FLINK_VERSION}-bin-scala_${SCALA_VERSION}.tgz -C /usr/lib && \
    rm -rf flink-${FLINK_VERSION}-bin-scala_${SCALA_VERSION}.tgz && \
    ln -s /usr/lib/flink-${FLINK_VERSION} /usr/lib/flink && \
    chown -R hadoop:hadoop /usr/lib/flink-${FLINK_VERSION} /usr/lib/flink

ENV FLINK_HOME /usr/lib/flink
ENV PATH ${FLINK_HOME}/bin:${PATH}

COPY supervisor.d/* /etc/supervisor.d/
RUN rm -rf /etc/supervisor.d/hadoop.conf
RUN rm -rf /etc/supervisor.d/hive.conf

RUN mkdir -p /var/log/flink && \
    chown -R flink:hadoop /var/log/flink && \
    chmod 775 -R /var/log/flink

COPY conf/* ${FLINK_HOME}/conf/
COPY bin/* ${FLINK_HOME}/bin/

RUN chown -R hadoop:hadoop ${FLINK_HOME}/conf/ ${FLINK_HOME}/bin/ && \
    chmod 775 -R ${FLINK_HOME}/conf/ ${FLINK_HOME}/bin/

EXPOSE 8080