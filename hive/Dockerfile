FROM registry.cn-hangzhou.aliyuncs.com/hdp-eco/hadoop

RUN wget -q https://apache.mirrors.lucidnetworks.net/hive/hive-2.3.7/apache-hive-2.3.7-bin.tar.gz && \
    tar -xf apache-hive-2.3.7-bin.tar.gz -C /usr/lib && \
    rm -rf apache-hive-2.3.7-bin.tar.gz && \
    ln -s /usr/lib/apache-hive-2.3.7-bin /usr/lib/hive && \
    chown -R hadoop:hadoop /usr/lib/apache-hive-2.3.7-bin /usr/lib/hive

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

RUN chown -R hadoop:hadoop ${HIVE_HOME}/conf/
RUN chown -R hadoop:hadoop ${HIVE_HOME}/bin/

RUN useradd -d /home/hive -m -g hadoop hive

## delete hadoop supervisor config
RUN rm -rf /etc/supervisor.d/hadoop.conf

COPY supervisor.d/* /etc/supervisor.d/

RUN mkdir -p /var/log/hive && \
    chown -R hive:hadoop /var/log/hive

EXPOSE 10000