FROM quay.io/ukhomeofficedigital/centos-base

RUN yum install java-1.8.0-openjdk-devel -y

RUN mkdir -p $HOME/.m2/ && \
    curl -sS \
    http://www.mirrorservice.org/sites/ftp.apache.org/maven/maven-3/3.3.1/binaries/apache-maven-3.3.1-bin.tar.gz \
    -o /tmp/apache-maven-3.3.1-bin.tar.gz && \
    tar xvzf /tmp/apache-maven-3.3.1-bin.tar.gz -C /tmp && \
    mv /tmp/apache-maven-3.3.1 /var/local/ && \
    ln -s /var/local/apache-maven-3.3.1/bin/mvnyjp /usr/local/bin/mvnyjp && \
    ln -s /var/local/apache-maven-3.3.1/bin/mvnDebug /usr/local/bin/mvnDebug && \
    ln -s /var/local/apache-maven-3.3.1/bin/mvn /usr/local/bin/mvn
