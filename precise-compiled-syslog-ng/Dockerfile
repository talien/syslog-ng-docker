FROM talien/syslog-ng
RUN mkdir /source && git clone -b 3.5/master https://github.com/balabit/syslog-ng /source/syslog-ng
RUN cd /source/syslog-ng/ && ./autogen.sh && ./configure --prefix=/usr && make && make install
