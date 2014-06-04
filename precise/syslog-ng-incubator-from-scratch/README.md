syslog-ng devel environment
===========================

It is a simple syslog-ng and incubator devel environment.

Usage: 
```
docker build -t <tag> precise/syslog-ng-incubator-from-scratch
docker run -i -a <tag>
```

This checks out the lastest syslog-ng, compiles it,
then checks out the incubator, compiles it, and opens a tmux 
with five windows each in the source, build directories for 
syslog-ng and incubator, and one for the common install directory.

You can override the default repo url and branch with the _repo_ and _branch_
environment variables for syslog-ng.

You can override the default repo url and branch with the _incubator\_repo_ and _incubator\_branch_
environment variables for the incubator.

You can exit the env with tmux detach.

You can re-start the container with docker start -i -a <container>, but the previously opened windows are
lost (filesystem changes are kept).
