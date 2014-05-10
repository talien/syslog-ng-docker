#!/bin/bash

# clone and compile syslog-ng

setup_syslog-ng()
{
  mkdir /build
  mkdir /install
  mkdir /source

  git clone ${repo:-https://github/balabit/syslog-ng} /source

  cd /source
  ./autogen.sh

  cd /build
  /source/configure --prefix /install --enable-debug

  make && make install
}

# setup tmux windows

if [ ! -f /source/autogen.sh ]
 then
  setup_syslog-ng
fi

tmux new-session -s syslog-ng -n source -d "cd /source; bash -i"
tmux new-window  -t syslog-ng -n build  "cd /build; bash -i"
tmux new-window  -t syslog-ng -n install  "cd /install; bash -i"

tmux attach -t syslog-ng
