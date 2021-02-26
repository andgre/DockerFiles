FROM openjdk:8u151-stretch
USER root
# Install pacakges
RUN apt-get update
# Install ssh
RUN apt-get -y install openssh-client maven git

# Confugure ssh client
COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa
RUN mkdir /root/docker


# Install docker 18.03
RUN apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update
RUN apt-get -y install docker-ce=18.03.1~ce-0~debian

# Clear cache
RUN apt-get clean
