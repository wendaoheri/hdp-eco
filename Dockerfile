FROM registry.cn-hangzhou.aliyuncs.com/hdp-eco/hdp-eco-base:latest

USER root

ADD config/startup.sh /

RUN chmod +x startup.sh

ADD config/other/bashrc /etc/

CMD [ "sh", "-c", "/startup.sh; bash"]