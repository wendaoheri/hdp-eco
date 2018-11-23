FROM centos:latest

USER root

RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

RUN yum makecache

RUN yum install -y openssh openssh-server openssh-clients