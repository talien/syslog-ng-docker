FROM talien/syslog-ng
RUN apt-get install -y --force-yes tmux
ADD ./setup.sh /setup.sh
ADD ./tmux.conf /etc/tmux.conf
CMD /setup.sh
