FROM registry.cn-hangzhou.aliyuncs.com/hdp-eco/hive

RUN useradd -d /home/spark -m -g hadoop spark

RUN wget -q https://downloads.apache.org/spark/spark-2.4.5/spark-2.4.5-bin-without-hadoop.tgz && \
    tar -xf spark-2.4.5-bin-without-hadoop.tgz -C /usr/lib && \
    rm -rf spark-2.4.5-bin-without-hadoop.tgz && \
    ln -s /usr/lib/spark-2.4.5-bin-without-hadoop /usr/lib/spark && \
    chown -R hadoop:hadoop /usr/lib/spark /usr/lib/spark-2.4.5-bin-without-hadoop

ENV SPARK_HOME /usr/lib/spark
ENV PATH ${SPARK_HOME}/bin:${SPARK_HOME}/sbin:${PATH}

COPY conf/* ${SPARK_HOME}/conf/
COPY bin/* ${SPARK_HOME}/bin/
COPY sbin/* ${SPARK_HOME}/sbin/

RUN chown -R spark:hadoop ${SPARK_HOME}/conf/ ${SPARK_HOME}/bin/ ${SPARK_HOME}/sbin/ && \
    chmod 775 -R ${SPARK_HOME}/conf/ ${SPARK_HOME}/bin/ ${SPARK_HOME}/sbin/

COPY supervisor.d/* /etc/supervisor.d/
RUN rm -rf /etc/supervisor.d/hive.conf

RUN mkdir -p /var/log/spark && \
    chown -R spark:hadoop /var/log/spark && \
    chmod 775 -R /var/log/spark

ENTRYPOINT [ "supervisord", "-c" , "/etc/supervisord.conf" ]