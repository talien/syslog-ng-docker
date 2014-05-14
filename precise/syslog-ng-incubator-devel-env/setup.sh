#!/bin/bash

# clone and compile syslog-ng

setup_syslog-ng()
{
  mkdir /build
  mkdir /source

  git clone -b ${incubator_branch:-master} ${repo:-https://github.com/balabit/syslog-ng-incubator} /source
  
  cd /source
  autoreconf -i

  cd /build
  /source/configure --enable-debug
  make && make install
}

# setup tmux windows

if [ ! -f /source/autogen.sh ]
 then
  setup_syslog-ng
fi

tmux new-session -s syslog-ng -n source -d "cd /source; bash -i"
tmux new-window  -t syslog-ng -n build  "cd /build; bash -i"
tmux new-window  -t syslog-ng -n install  "cd /; bash -i"

tmux attach -t syslog-ng
