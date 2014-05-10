syslog-ng devel environment
===========================

It is a simple syslog-ng devel environment.

Usage: 
```
docker build -t <tag> precise/syslog-ng-devel-env
docker run -i -a <tag>
```

This checks out the latest syslog-ng, compiles it,
and opens a tmux with three windows each in the 
source, build, and install directory.

You can exit the env with tmux detach.

You can switch between windows with Shift-Left and Shift-Right (default tmux binding are overridden, sorry).

The default repo which is checked out is https://github.com/balabit/syslog-ng but you can override it by setting the "repo"
environment variable when running the image.

```
docker run -i -a -e repo=https://github.com/talien/syslog-ng  <tag>
```

You can re-start the container with docker start -i -a <container>, but the previously opened windows are
lost (filesystem changes are kept).
