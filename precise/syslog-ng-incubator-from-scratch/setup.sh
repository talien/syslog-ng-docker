#!/bin/bash

# clone and compile syslog-ng

checkout_syslog_ng()
{
  mkdir /${prefix}/syslog-ng
  
  git clone -b ${branch:-master} ${repo:-https://github.com/balabit/syslog-ng} /${prefix}/syslog-ng
}

checkout_incubator()
{
  mkdir /${prefix}/incubator

  git clone -b ${incubator_branch:-master} ${incubator_repo:-https://github.com/balabit/syslog-ng-incubator} /${prefix}/incubator
}

build_syslog_ng()
{
  mkdir /build
  mkdir /install

  cd /$prefix/syslog-ng/
  ./autogen.sh
  
  cd /build/
  /$prefix/syslog-ng/configure --prefix /install --enable-debug
  make && make install
}

build_incubator()
{  
  mkdir /incubator-build

  cd /${prefix}/incubator
  autoreconf -i

  cd /build
  PKG_CONFIG_PATH=/install/lib/pkgconfig /${prefix}/incubator/configure --enable-debug
  make && make install
}

# setup tmux windows

if [ ! -f /$prefix/syslog-ng/autogen.sh ]
 then
  checkout_syslog_ng
fi

if [ ! -d /build ]
 then
  build_syslog_ng
fi

if [ ! -f /$prefix/incubator/configure.ac ]
 then
  checkout_incubator
fi

if [ ! -d /incubator-build ]
 then
  build_incubator
fi

tmux new-session -s syslog-ng -n syslog-ng -d "cd /$prefix/syslog-ng; bash -i"
tmux new-window  -t syslog-ng:1 -n build  "cd /build; bash -i"
tmux new-window  -t syslog-ng:2 -n incubator "cd /$prefix/incubator; bash -i"
tmux new-window  -t syslog-ng:3 -n incubator-build  "cd /incubator-build; bash -i"
tmux new-window  -t syslog-ng:4 -n install  "cd /install; bash -i"

tmux attach -t syslog-ng
