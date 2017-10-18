FROM quay.io/ukhomeofficedigital/openjdk8:v1.1.0

RUN yum clean all && \
    yum update -y --exclude iputils* --exclude filesystem* && \
    yum install -y wget curl unzip gettext git && \
    yum clean all && \
    rpm --rebuilddb

ENV MVN_VERSION=3.3.9 \
    ARTIFACTORY_USERNAME=user \
    ARTIFACTORY_PASSWORD=pass

RUN mkdir -p $HOME/.m2/ && \
    curl -sS \
    http://www.mirrorservice.org/sites/ftp.apache.org/maven/maven-3/${MVN_VERSION}/binaries/apache-maven-${MVN_VERSION}-bin.tar.gz \
    -o /tmp/apache-maven-${MVN_VERSION}-bin.tar.gz && \
    tar xvzf /tmp/apache-maven-${MVN_VERSION}-bin.tar.gz -C /tmp && \
    mv /tmp/apache-maven-${MVN_VERSION} /var/local/ && \
    ln -s /var/local/apache-maven-${MVN_VERSION}/bin/mvnyjp /usr/local/bin/mvnyjp && \
    ln -s /var/local/apache-maven-${MVN_VERSION}/bin/mvnDebug /usr/local/bin/mvnDebug && \
    ln -s /var/local/apache-maven-${MVN_VERSION}/bin/mvn /usr/local/bin/mvn

RUN mkdir /app

WORKDIR /app

COPY settings.xml.sub $HOME/.m2/.

COPY entrypoint.sh /root/entrypoint.sh

ENTRYPOINT ["/root/entrypoint.sh"]
