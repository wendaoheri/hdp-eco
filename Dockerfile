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
    ln -s /opt/jdk1.8.0_191 /opt/jdk

ENV JAVA_HOME /opt/jdk
ENV CLASSPATH .:${JAVA_HOME}/lib;${JAVA_HOME}/lib/tools.jar
ENV PATH ${JAVA_HOME}/bin