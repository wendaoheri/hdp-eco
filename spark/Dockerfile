FROM registry.cn-hangzhou.aliyuncs.com/hdp-eco/hive

ENV SPARK_VERSION 2.4.5

RUN useradd -d /home/spark -m -g hadoop spark

USER hadoop
WORKDIR /home/hadoop

RUN wget -q https://github.com/apache/spark/archive/v${SPARK_VERSION}}.tar.gz -O spark.tar.gz && \
    tar -xf spark.tar.gz

# ENV SPARK_HOME /usr/lib/spark
# ENV PATH ${SPARK_HOME}/bin:${SPARK_HOME}/sbin:${PATH}

# COPY conf/* ${SPARK_HOME}/conf/
# COPY bin/* ${SPARK_HOME}/bin/
# COPY sbin/* ${SPARK_HOME}/sbin/

# RUN chown -R spark:hadoop ${SPARK_HOME}/conf/ ${SPARK_HOME}/bin/ ${SPARK_HOME}/sbin/ && \
#     chmod 775 -R ${SPARK_HOME}/conf/ ${SPARK_HOME}/bin/ ${SPARK_HOME}/sbin/

# COPY supervisor.d/* /etc/supervisor.d/
# RUN rm -rf /etc/supervisor.d/hive.conf

# RUN mkdir -p /var/log/spark && \
#     chown -R spark:hadoop /var/log/spark && \
#     chmod 775 -R /var/log/spark

# COPY entrypoint.sh /

# RUN chown spark:hadoop /entrypoint.sh && chmod +x /entrypoint.sh

# ENTRYPOINT [ "sh", "-c", "/entrypoint.sh" ]