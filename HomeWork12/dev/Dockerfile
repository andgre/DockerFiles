FROM alpine:latest

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN  apk -U upgrade --update && \
        apk --no-cache add openjdk11 && \
        apk --no-cache add maven && \
        apk --no-cache add git && \
        apk --no-cache add bash

RUN mkdir -p /opt/myapp && cd /opt/myapp && \
    git clone https://github.com/shephertz/App42PaaS-Java-MySQL-Sample.git
COPY dev/Config.properties /opt/myapp/App42PaaS-Java-MySQL-Sample/WebContent/Config.properties
RUN   cd /opt/myapp/App42PaaS-Java-MySQL-Sample/ &&  mvn package

#COPY run.sh /run.sh
#ENTRYPOINT ["/bin/sh", "-c", "/run.sh"]