FROM micek/precise_base:latest

MAINTAINER Andras Mitzki micek@balabit.hu

# Reduce output from debconf
ENV DEBIAN_FRONTEND noninteractive
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list
RUN apt-get install -y wget
RUN wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc -O /tmp/rabbitmq-signing-key-public.asc
RUN apt-key add /tmp/rabbitmq-signing-key-public.asc
RUN apt-get -y update

# Docker workaround for upstart: [https://github.com/dotcloud/docker/issues/1024]
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl

RUN apt-get install -y rabbitmq-server
RUN rabbitmq-plugins enable rabbitmq_management

# For RabbitMQ and RabbitMQ Admin
EXPOSE 5672 15672

ENTRYPOINT ["/usr/sbin/rabbitmq-server"]