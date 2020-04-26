FROM registry.cn-hangzhou.aliyuncs.com/hdp-eco/hive

ENV SPARK_VERSION 2.4.5

RUN useradd -d /home/spark -m -g hadoop spark

RUN ln -sf /usr/bin/python3 /usr/bin/python

USER hadoop
WORKDIR /home/hadoop

RUN wget -q https://github.com/apache/spark/archive/v${SPARK_VERSION}.tar.gz -O spark.tar.gz && \
    tar -xf spark.tar.gz && \
    cd spark-${SPARK_VERSION} && \
    export MAVEN_OPTS="-Xmx2g -XX:ReservedCodeCacheSize=1g" && \
    ./dev/make-distribution.sh --name spark --pip --tgz -q -Phive -Phive-thriftserver -Pyarn -Phadoop-provided -Phive-provided -Dhadoop.version=${HADOOP_VERSION}


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