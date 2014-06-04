FROM talien/syslog-ng

RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
RUN echo "deb http://packages.madhouse-project.org/ubuntu precise syslog-ng-devel" >> /etc/apt/sources.list

RUN curl -k https://packages.madhouse-project.org/debian/archive-key.txt | apt-key add -
RUN apt-get update
RUN apt-get install -y --force-yes tmux liblua5.2-dev libmongo-client-dev syslog-ng-dev libperl-dev python-dev python3-dev libriemann-client-dev

ADD ./setup.sh /setup.sh
ADD ./tmux.conf /etc/tmux.conf
CMD /setup.sh
