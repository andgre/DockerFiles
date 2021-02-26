FROM ubuntu:20.04
ENV CATALINA_BASE /var/lib/tomcat9
ENV CATALINA_HOME /usr/share/tomcat9
ENV PATH $CATALINA_HOME/bin:$PATH
WORKDIR $CATALINA_HOME
RUN apt update && \
    apt install  tomcat9 -y
COPY hello-1.0.war /var/lib/tomcat9/webapps/
RUN sed -i 's/8080/80/g' /etc/tomcat9/server.xml
EXPOSE 80

ENTRYPOINT ["catalina.sh", "run"]

