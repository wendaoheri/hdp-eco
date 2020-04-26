FROM registry.cn-hangzhou.aliyuncs.com/hdp-eco/hadoop

ENV HIVE_VERSION 2.3.7

RUN wget -q https://downloads.apache.org/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz && \
    tar -xf apache-hive-${HIVE_VERSION}-bin.tar.gz -C /usr/lib && \
    rm -rf apache-hive-${HIVE_VERSION}-bin.tar.gz && \
    ln -s /usr/lib/apache-hive-${HIVE_VERSION}-bin /usr/lib/hive && \
    chown -R hadoop:hadoop /usr/lib/apache-hive-${HIVE_VERSION}-bin /usr/lib/hive

RUN wget -q https://cdn.mysql.com//archives/mysql-connector-java-8.0/mysql-connector-java-8.0.11.zip && \
    unzip -q mysql-connector-java-8.0.11.zip  && \
    mkdir -p /usr/share/java && \
    mv mysql-connector-java-8.0.11/mysql-connector-java-8.0.11.jar /usr/share/java && \
    ln -s /usr/share/java/mysql-connector-java-8.0.11.jar /usr/share/java/mysql-connector-java.jar && \
    ln -s /usr/share/java/mysql-connector-java.jar /usr/lib/hive/lib/mysql-connector-java.jar && \
    chown hadoop:hadoop /usr/share/java/mysql-connector-java-8.0.11.jar /usr/share/java/mysql-connector-java.jar /usr/lib/hive/lib/mysql-connector-java.jar && \
    rm -rf mysql-connector-java-8.0.11*

ENV HIVE_HOME /usr/lib/hive
ENV PATH ${HIVE_HOME}/bin:${PATH}


COPY conf/* ${HIVE_HOME}/conf/
COPY bin/* ${HIVE_HOME}/bin/


RUN useradd -d /home/hive -m -g hadoop hive

RUN chown -R hadoop:hadoop ${HIVE_HOME}/conf/ ${HIVE_HOME}/bin/ && \
    chmod 775 -R ${HIVE_HOME}/conf/ ${HIVE_HOME}/bin/ && \
    mkdir /tmp/hive && chown hive:hadoop /tmp/hive && chmod 775 -R /tmp/hive

## delete hadoop supervisor config
RUN rm -rf /etc/supervisor.d/hadoop.conf

COPY supervisor.d/* /etc/supervisor.d/

RUN mkdir -p /var/log/hive && \
    chown -R hive:hadoop /var/log/hive && \
    chmod 775 -R /var/log/hive

COPY entrypoint.sh /

RUN chown hive:hadoop /entrypoint.sh && chmod +x /entrypoint.sh

ENTRYPOINT [ "sh", "-c", "/entrypoint.sh" ]

EXPOSE 10000