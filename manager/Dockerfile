FROM registry.cn-hangzhou.aliyuncs.com/hdp-eco/hdp-eco-base

ENV CESI_SETUP_PATH /usr/lib/cesi
ENV CESI_VERSION 2.6.8

RUN mkdir ${CESI_SETUP_PATH}

WORKDIR ${CESI_SETUP_PATH}

RUN wget -q https://github.com/gamegos/cesi/releases/download/v${CESI_VERSION}/cesi-extended.tar.gz -O cesi.tar.gz && \
    tar -xf cesi.tar.gz && \
    pip3 install -r requirements.txt && \
    pip3 install gunicorn && \
    rm -rf cesi.tar.gz

COPY conf/* /etc/

COPY supervisor.d/* /etc/supervisor.d/

RUN mkdir -p /var/log/cesi

EXPOSE 5000