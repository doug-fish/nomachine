#!/bin/sh
/etc/NX/nxserver --startup

# Taken from the documentation; there has to be a better
# way - this seems like a poor way to get a "random"
# value
COOKIE=`ps -ef | md5sum | cut -f 1 -d " "`
AUTHFILE=$HOME/Xvfb-0.auth
xauth -f $AUTHFILE add :0 MIT-MAGIC-COOKIE-1 $COOKIE 
xauth add :0 MIT-MAGIC-COOKIE-1 $COOKIE

Xvfb :0 -auth $HOME/Xvfb-0.auth -screen 0 1024x768x24 &

DISPLAY=:0 nohup /etc/X11/Xsession default &

tail -f /usr/NX/var/log/nxserver.log
