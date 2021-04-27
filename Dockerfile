FROM jenkins/jenkins:lts
USER root
RUN mkdir /new_app
WORKDIR /new_app

COPY requirements.txt /new_app

RUN pwd
RUN ls -la

# install python, FreeTDS and dependencies
RUN apt-get update \
 && apt-get install -y python3-pip \
 && apt-get install unixodbc -y \
 && apt-get install unixodbc-dev -y \
 && apt-get install freetds-dev -y \
 && apt-get install freetds-bin -y \
 && apt-get install tdsodbc -y \
 && apt-get install --reinstall build-essential -y

# populate "odbcinst.ini"
RUN echo "[FreeTDS]\n\
Description = FreeTDS unixODBC Driver\n\
Driver = /usr/lib/x86_64-linux-gnu/odbc/libtdsodbc.so\n\
Setup = /usr/lib/x86_64-linux-gnu/odbc/libtdsS.so\n\" >> /etc/odbcinst.ini