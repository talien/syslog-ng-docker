FROM precise-installed-syslog-ng-deps:latest

MAINTAINER Andras Mitzki micek@balabit.hu

RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
RUN echo "deb http://packages.madhouse-project.org/ubuntu   precise   syslog-ng-devel" >> /etc/apt/sources.list

RUN curl https://packages.madhouse-project.org/debian/archive-key.txt | sudo apt-key add -

ENV INSTALLED_APPS syslog-ng
RUN apt-get update
RUN apt-get install -y -V -f $INSTALLED_APPS
