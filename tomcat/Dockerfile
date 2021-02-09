ROM ubuntu:20.04
#USER root
ENV CATALINA_BASE /var/lib/tomcat9
ENV CATALINA_HOME /usr/share/tomcat9
ENV PATH $CATALINA_HOME/bin:$PATH
WORKDIR $CATALINA_HOME
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && \
    apt install default-jdk tomcat9 maven net-tools git -y
#    apt install default-jdk tomcat9 maven git -y   && \
#    git clone https://github.com/jenkinsci/jenkins.git && \
#    cd ./jenkins/ && mvn package && \
#    mkdir /home/jenkins && chowm tomcat /home/jenkins/

#COPY ./war/target/jenkins.war /var/lib/tomcat9/webapps/
#RUN sed -i 's/<\/Context>/<Environment name="JENKINS_HOME" value="\/home\/jenkins\/" type="java.lang.String"\/><\/Context>/' /var/lib/tomcat9/conf/context.xml

EXPOSE 8080

ENTRYPOINT ["catalina.sh", "run"]
# CMD ["catalina.sh", "run"]
