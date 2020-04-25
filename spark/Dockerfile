FROM registry.cn-hangzhou.aliyuncs.com/hdp-eco/hive

RUN useradd -d /home/spark -m -g hadoop spark

RUN wget -q https://downloads.apache.org/spark/spark-2.4.5/spark-2.4.5-bin-without-hadoop.tgz && \
    tar -xf spark-2.4.5-bin-without-hadoop.tgz -C /usr/lib && \
    rm -rf spark-2.4.5-bin-without-hadoop.tgz && \
    ln -s /usr/lib/spark-2.4.5-bin-without-hadoop /usr/lib/spark && \
    chown -R hadoop:hadoop /usr/lib/spark /usr/lib/spark-2.4.5-bin-without-hadoop