FROM registry.cn-hangzhou.aliyuncs.com/hdp-eco/hive

ENV SPARK_VERSION 2.4.5
ENV LIVY_VERSION 0.7.0-incubating

RUN useradd -d /home/spark -m -g hadoop spark

WORKDIR /root

RUN wget -q https://github.com/apache/spark/archive/v${SPARK_VERSION}.tar.gz -O spark.tar.gz && \
    tar -xf spark.tar.gz && \
    cd spark-${SPARK_VERSION} && \
    export MAVEN_OPTS="-Xmx2g -XX:ReservedCodeCacheSize=1g" && \
    ./dev/make-distribution.sh --name spark -Phive -Phive-thriftserver -Pyarn -Dhadoop.version=${HADOOP_VERSION} && \
    mv ~/spark-${SPARK_VERSION}/dist ~/spark-${SPARK_VERSION}-bin-spark && \
    cd ~ && rm -rf spark.tar.gz spark-${SPARK_VERSION} .m2 && \
    mv /root/spark-${SPARK_VERSION}-bin-spark /usr/lib && \
    ln -s /usr/lib/spark-${SPARK_VERSION}-bin-spark /usr/lib/spark && \
    chmod 775 -R /usr/lib/spark-${SPARK_VERSION}-bin-spark /usr/lib/spark

RUN wget -q http://archive.apache.org/dist/incubator/livy/${LIVY_VERSION}/apache-livy-${LIVY_VERSION}-bin.zip && \
    unzip -q apache-livy-${LIVY_VERSION}-bin.zip && \
    mv apache-livy-${LIVY_VERSION}-bin /usr/lib && \
    ln -s /usr/lib/apache-livy-${LIVY_VERSION}-bin /usr/lib/livy && \
    rm -rf apache-livy-${LIVY_VERSION}-bin.zip && \
    chown -R hadoop:hadoop /usr/lib/apache-livy-${LIVY_VERSION}-bin /usr/lib/livy

ENV SPARK_HOME /usr/lib/spark
ENV LIVY_HOME /usr/lib/livy
ENV PATH ${SPARK_HOME}/bin:${SPARK_HOME}/sbin:${LIVY_VERSION}/bin:${PATH}

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

COPY entrypoint.sh /

RUN chown spark:hadoop /entrypoint.sh && chmod +x /entrypoint.sh

ENTRYPOINT [ "sh", "-c", "/entrypoint.sh" ]