FROM ubuntu:precise

MAINTAINER Andras Mitzki micek@balabit.hu

ENV INSTALLED_APPS git automake bison debhelper dh-autoreconf docbook-xsl flex libcap-dev libdbi-dev libesmtp-dev libevtlog-dev libgeoip-dev libglib2.0-0-dbg libglib2.0-dev libhiredis-dev libjson0-dev libmongo-client-dev libnet1-dev libpcre3-dev libssl-dev libtool libwrap0-dev lsb-release pkg-config xsltproc
RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list && apt-get update && apt-get upgrade -y -V && apt-get install -y -V $INSTALLED_APPS && apt-get clean
