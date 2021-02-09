FROM ubuntu:20.04
USER root
ENV CATALINA_BASE /var/lib/tomcat9
ENV CATALINA_HOME /usr/share/tomcat9
ENV PATH $CATALINA_HOME/bin:$PATH
WORKDIR $CATALINA_HOME
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/
ENV PATH $JAVA_HOME/bin:$PATH

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

##-Dclassworlds.conf=/usr/share/maven/bin/m2.conf
#ENV  CLASSWORlDS_CONF /usr/share/maven/bin/m2.conf
##-Dmaven.home=/usr/share/maven
#ENV MAVEN_HOME /usr/share/mavena
##-Dlibrary.jansi.path=/usr/share/maven/lib/jansi-native
#ENV LIBRARY_JANSI_PATH /usr/share/maven/lib/jansi-native
##-Dmaven.multiModuleProjectDirectory=/root/jenkins
#ENV MAVEN_MULTIMODULEPROJECTDIRECTORY /root/jenkins

RUN apt update && \
    apt install default-jdk tomcat9 maven net-tools git -y && \
    mkdir -p /home/maven/ && cd /home/maven && \
    git clone https://github.com/jenkinsci/jenkins.git
RUN cd /home/maven/jenkins/ && \
#    sed  -i 's/<systemPropertyVariables>/<systemPropertyVariables><testFailureIgnore>true<\/testFailureIgnore>/' pom.xml && \
    mvn clean package && \
    mkdir /home/jenkins && chowm tomcat /home/jenkins/ && \
    cp ./war/target/jenkins.war /var/lib/tomcat9/webapps/ && \
    sed -i 's/<\/Context>/<Environment name="JENKINS_HOME" value="\/home\/jenkins\/" type="java.lang.String"\/><\/Context>/' /var/lib/tomcat9/conf/context.xml



EXPOSE 8080

ENTRYPOINT ["catalina.sh", "run"]