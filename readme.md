# nomachine
This is based on the free nomachine - it's likely the licesnsed one would be better for ssh access.

##
Weird stuff to get this to work in a local docker environment:
edit the local /etc/hosts on the clientside so that the container id (which docker assigns as a hostname) resolves to localhost

after starting the container log in and set a password for root - I'm logging in as root assuming that will minimize any permission issues.

### Current failure output:

    R5016633:~$ docker run -P nomachine
    NX> 111 New connections to NoMachine server are enabled.
    NX> 161 Enabled service: nxserver.
    NX> 162 WARNING: Cannot find X servers running on this machine.
    NX> 162 WARNING: A new virtual display will be created on demand.
    NX> 161 Enabled service: nxd.
    xauth:  file /root/Xvfb-0.auth does not exist
    xauth:  file /root/.Xauthority does not exist
    tail: unrecognized file system type 0x794c7630 for '/usr/NX/var/log/nxserver.log'. please report this to bug-coreutils@gnu.org. reverting to polling
    2018-08-27 14:54:04 099.327  2992 NXSERVER Starting LS 6.2.4 and services.
    2018-08-27 14:54:04 099.456  2992 NXSERVER System information: Debian, standalone.
    2018-08-27 14:54:04 110.613  2992 NXSERVER WARNING! Process '/usr/bin/dbus-send --system --dest=org.freedesktop.DBus --type=method_call --print-reply /org/freedesktop/DBus org.freedesktop.DBus.ListNames' with pid '3004/3004' finished with exit code 1 after 0,005 seconds.
    2018-08-28 18:09:29 966.057    14 NXSERVER Starting LS 6.2.4 and services.
    2018-08-28 18:09:29 966.253    14 NXSERVER System information: Debian, standalone.
    2018-08-28 18:09:29 974.717    14 NXSERVER WARNING! Process '/usr/bin/dbus-send --system --dest=org.freedesktop.DBus --type=method_call --print-reply /org/freedesktop/DBus org.freedesktop.DBus.ListNames' with pid '26/26' finished with exit code 1 after 0,004 seconds.
    2018-08-28 18:10:01 073.918    14 NXSERVER WARNING! Process '/usr/NX/bin/nxexec /usr/NX/scripts/restricted/nxenvironmentget.sh 49' with pid '191/191' finished with exit code 1 after 0,008 seconds.
    2018-08-28 18:10:01 074.316    14 NXSERVER WARNING! __getProcessEnvironment /usr/NX/scripts/restricted/nxenvironmentget.sh finished with 1
    2018-08-28 18:10:01 084.252    14 NXSERVER WARNING! Process '/usr/NX/bin/nxexec nxcookieget.sh /usr/bin/xauth root 0 /root/Xvfb-0.auth' with pid '192/192' finished with exit code 1 after 0,006 seconds.
    2018-08-28 18:10:01 084.617    14 NXSERVER WARNING! checkLocalSession: command '/usr/NX/bin/nxexec nxcookieget.sh /usr/bin/xauth root 0 /root/Xvfb-0.auth' finished with exit code '1'. Check nxerror.log for details.
    2018-08-28 18:10:01 095.158    14 NXSERVER WARNING! Process '/usr/NX/bin/nxexec /usr/NX/scripts/restricted/nxenvironmentget.sh 49' with pid '193/193' finished with exit code 1 after 0,008 seconds.
    2018-08-28 18:10:01 095.446    14 NXSERVER WARNING! __getProcessEnvironment /usr/NX/scripts/restricted/nxenvironmentget.sh finished with 1
    2018-08-28 18:10:54 832.494   201 NXSERVER User 'root' logged in from '172.17.0.1' using authentication method password.
    2018-08-28 18:11:02 132.126    14 NXSERVER WARNING! Process '/usr/NX/bin/nxexec /usr/NX/scripts/restricted/nxenvironmentget.sh 49' with pid '219/219' finished with exit code 1 after 0,007 seconds.
    2018-08-28 18:11:02 132.487    14 NXSERVER WARNING! __getProcessEnvironment /usr/NX/scripts/restricted/nxenvironmentget.sh finished with 1
    2018-08-28 18:11:02 142.167    14 NXSERVER WARNING! Process '/usr/NX/bin/nxexec nxcookieget.sh /usr/bin/xauth root 0 /root/Xvfb-0.auth' with pid '220/220' finished with exit code 1 after 0,006 seconds.
    2018-08-28 18:11:02 152.889    14 NXSERVER WARNING! Process '/usr/NX/bin/nxexec /usr/NX/scripts/restricted/nxenvironmentget.sh 49' with pid '221/221' finished with exit code 1 after 0,006 seconds.
    2018-08-28 18:11:02 153.150    14 NXSERVER WARNING! __getProcessEnvironment /usr/NX/scripts/restricted/nxenvironmentget.sh finished with 1
    2018-08-28 18:12:01 814.179    14 NXSERVER WARNING! Process '/usr/NX/bin/nxexec --node --user root --priority realtime --mode 0 --pid 21' with pid '244/244' finished with exit code 1 after 0,006 seconds.
    2018-08-28 18:12:01 814.764    14 NXSERVER ERROR! libnxh::NXSelect(5,17,8,18,19,12) exited with error 'Bad file descriptor'.
    2018-08-28 18:12:01 815.271   229 NXSERVER ERROR! Cannot start node to create session
    2018-08-28 18:12:01 816.610   201 NXSERVER ERROR! Socket to the server --daemon closed unexpectedly
    2018-08-28 18:12:01 817.235   229 NXSERVER WARNING! Cannot write to FD#1.
    2018-08-28 18:12:01 817.349   229 NXSERVER WARNING! Error is: 32, 'Broken pipe'.
    2018-08-28 18:12:01 931.866   201 NXSERVER User 'root' from '172.17.0.1' logged out.
    2018-08-28 18:12:18 125.989   246 NXSERVER WARNING! Process '/usr/NX/bin/nxexec --auth' with pid '261/261' finished with exit code 1 after 2,486 seconds.
    2018-08-28 18:12:18 126.393   246 NXSERVER ERROR! Error while trying to authenticate user: root using authentication method password. NXNssUserManager::auth returned 1
    2018-08-28 18:12:18 126.765   246 NXSERVER ERROR! wrong 'nxexec authentication' for user 'root' from '172.17.0.1'.
    2018-08-28 18:12:25 125.018   263 NXSERVER User 'root' logged in from '172.17.0.1' using authentication method password.
    2018-08-28 18:12:35 771.566   263 NXSERVER User 'root' from '172.17.0.1' logged out.
    2018-08-28 18:16:46 351.368   280 NXSERVER WARNING! Cannot write to FD#8.
    2018-08-28 18:16:46 351.670   280 NXSERVER WARNING! Error is: 32, 'Broken pipe'.
    2018-08-28 18:16:46 351.986   280 NXSERVER WARNING! Cannot write to FD#8.
    2018-08-28 18:16:46 352.094   280 NXSERVER WARNING! Error is: 32, 'Broken pipe'.

### References
[https://www.nomachine.com/DT08M00099](https://www.nomachine.com/DT08M00099)
[https://www.nomachine.com/AR06N00891](https://www.nomachine.com/AR06N00891)
