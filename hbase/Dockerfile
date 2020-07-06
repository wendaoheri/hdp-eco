FROM registry.cn-hangzhou.aliyuncs.com/hdp-eco/spark

ENV HBASE_VERSION 1.6.0

RUN useradd -d /home/hbase -m -g hadoop hbase

WORKDIR /root

RUN wget -q https://archive.apache.org/dist/hbase/${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz && \
    tar -xf hbase-${HBASE_VERSION}-bin.tar.gz -C /usr/lib && \
    rm -rf hbase-${HBASE_VERSION}-bin.tar.gz && \
    ln -s /usr/lib/hbase-${HBASE_VERSION} /usr/lib/hbase && \
    chown -R hadoop:hadoop /usr/lib/hbase-${HBASE_VERSION} /usr/lib/hbase

ENV HBASE_HOME /usr/lib/hbase
ENV PATH ${HBASE_HOME}/bin:${PATH}


COPY conf/* ${HBASE_HOME}/conf/
COPY bin/* ${HBASE_HOME}/bin/

COPY supervisor.d/* /etc/supervisor.d/
RUN rm -rf /etc/supervisor.d/spark.conf

RUN chown -R hbase:hadoop ${HBASE_HOME}/conf/ ${HBASE_HOME}/bin/  && \
    chmod 775 -R ${HBASE_HOME}/conf/ ${HBASE_HOME}/bin/

RUN mkdir -p /var/log/hbase && \
    chown -R hbase:hadoop /var/log/hbase && \
    chmod 775 -R /var/log/hbase

COPY entrypoint.sh /

RUN chown hbase:hadoop /entrypoint.sh && chmod +x /entrypoint.sh

ENTRYPOINT [ "sh", "-c", "/entrypoint.sh" ]