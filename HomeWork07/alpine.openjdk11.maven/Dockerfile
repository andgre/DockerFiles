FROM alpine:latest

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN  apk -U upgrade --update && \
        apk --no-cache add openjdk11 && \
        apk --no-cache add maven && \
        apk --no-cache add git && \
        apk --no-cache add bash

RUN mkdir -p /opt/myapp && cd /opt/myapp && \
    git clone https://github.com/venkaDaria/puzzle15.git && \
    cd ./puzzle15 && \
    sed  -i 's/<\/project>/<properties><maven.compiler.source>1.8<\/maven.compiler.source><maven.compiler.target>1.8<\/maven.compiler.target><\/properties><\/project>/' pom.xml && \
    mvn package

COPY run.sh /run.sh

ENTRYPOINT ["/bin/sh", "-c", "/run.sh"]
