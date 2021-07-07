FROM quay.io/ukhomeofficedigital/openjdk8:v1.8.0.292

ENV HOME=/root \
    MVN_VERSION=3.8.2

RUN dnf update -y && \ 
    dnf upgrade -y && \
    dnf install -y git glibc-langpack-en && \
    dnf clean all

RUN mkdir -p ${HOME}/.m2/ && \
    curl -sS \
    http://www.mirrorservice.org/sites/ftp.apache.org/maven/maven-3/${MVN_VERSION}/binaries/apache-maven-${MVN_VERSION}-bin.tar.gz \
    -o /tmp/apache-maven-${MVN_VERSION}-bin.tar.gz && \
    tar xvzf /tmp/apache-maven-${MVN_VERSION}-bin.tar.gz -C /tmp && \
    rm /tmp/apache-maven-${MVN_VERSION}-bin.tar.gz && \
    mv /tmp/apache-maven-${MVN_VERSION} /var/local/ && \
    ln -s /var/local/apache-maven-${MVN_VERSION}/bin/mvnyjp /usr/local/bin/mvnyjp && \
    ln -s /var/local/apache-maven-${MVN_VERSION}/bin/mvnDebug /usr/local/bin/mvnDebug && \
    ln -s /var/local/apache-maven-${MVN_VERSION}/bin/mvn /usr/local/bin/mvn

RUN mkdir /app

WORKDIR /app

COPY settings.xml ${HOME}/.m2/

ENTRYPOINT ["/bin/bash", "-c"]

CMD ["mvn -v"]
