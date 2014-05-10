syslog-ng devel environment
===========================

It is a simple syslog-ng devel environment.

Usage: 
```
docker build -t <tag> precise/syslog-ng-devel-env
docker run -i -a <tag>
```

This checks out the lastest syslog-ng, compiles it,
and opens a tmux with three windows each in the 
source, build, and install directory.

You can exit the env with tmux detach.

You can re-start the container with docker start -i -a <container>, but the previously opened windows are
lost (filesystem changes are kept).
