FROM ubuntu:20.04
USER root
ENV CATALINA_BASE /var/lib/tomcat9
ENV CATALINA_HOME /usr/share/tomcat9
ENV PATH $CATALINA_HOME/bin:$PATH
WORKDIR $CATALINA_HOME

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


RUN apt update && \
    apt install default-jdk tomcat9 maven net-tools git -y
RUN git clone https://github.com/venkaDaria/puzzle15.git && \
    cd ./puzzle15 && pwd && ls -ltra && \
    sed  -i 's/<\/project>/<properties><maven.compiler.source>1.8<\/maven.compiler.source><maven.compiler.target>1.8<\/maven.compiler.target><\/properties><\/project>/' pom.xml && \
     pwd && ls -ltra && mvn package && \
    cp ./target/Puzzle15-1.0-SNAPSHOT.war /var/lib/tomcat9/webapps/

EXPOSE 8080

ENTRYPOINT ["catalina.sh", "run"]
# CMD ["catalina.sh", "run"]
