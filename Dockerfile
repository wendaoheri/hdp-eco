FROM centos:centos7

USER root

# install required software
RUN yum install -y openssh openssh-server openssh-clients wget

# config ssh 
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
    
ADD config/other/ssh_config /root/.ssh/config
RUN chmod 600 /root/.ssh/config && \
    chown root:root /root/.ssh/config


# download jdk
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz"

RUN tar -xvf jdk-8u191-linux-x64.tar.gz -C /opt && \
    ln -s /opt/jdk1.8.0_191 /opt/jdk && \
    rm -rf jdk-8u191-linux-x64.tar.gz

# install jdk
ENV JAVA_HOME /opt/jdk
ENV CLASSPATH .:${JAVA_HOME}/lib;${JAVA_HOME}/lib/tools.jar
ENV PATH ${JAVA_HOME}/bin:$PATH

# download hadoop
RUN wget https://archive.apache.org/dist/hadoop/common/hadoop-2.7.3/hadoop-2.7.3.tar.gz

# install hadoop
RUN tar -xvf hadoop-2.7.3.tar.gz -C /opt && \
    ln -s /opt/hadoop-2.7.3 /opt/hadoop && \
    rm -rf hadoop-2.7.3.tar.gz

ENV HADOOP_HOME /opt/hadoop
ENV HADOOP_CONF_DIR ${HADOOP_HOME}/etc/hadoop
ENV PATH ${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin:${PATH}