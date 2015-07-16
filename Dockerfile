FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y install software-properties-common && \
    add-apt-repository ppa:webupd8team/java && \
    apt-get update && \
    apt-get -y upgrade && \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get -y install oracle-java7-installer && \
    apt-get clean && \
    apt-get purge && \
    update-alternatives --display java && \
    echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle" >> /etc/environment
