FROM ubuntu:14.04
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all python-pip
WORKDIR  /opt/webapp/
ADD requirements.txt /tmp/
#RUN pip install --help
RUN pip install -r /tmp/requirements.txt
ADD app.py /opt/webapp/
EXPOSE 5000
CMD ["python", "/opt/webapp/app.py"]
