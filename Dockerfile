# Dockerfile to install NoMachine free v. 5 with MATE interface 
FROM debian:jessie

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update

RUN apt-get update && apt-get install -y vim xterm pulseaudio cups curl
ENV NOMACHINE_PACKAGE_NAME nomachine_6.2.4_1_amd64.deb
ENV NOMACHINE_MD5 210bc249ec9940721a1413392eee06fe

RUN apt-get install -y mate-desktop-environment-core

# Installation of ssh is required if you want to connect to NoMachine server using SSH protocol when supported.
# Comment it out if you don't need it or if you use NoMachine free.

RUN apt-get install -y ssh \

&& service ssh start 

RUN curl -fSL "https://download.nomachine.com/download/6.2/Linux/${NOMACHINE_PACKAGE_NAME}" -o nomachine.deb \
&& echo "${NOMACHINE_MD5} *nomachine.deb" | md5sum -c - \
&& dpkg -i nomachine.deb \
&& groupadd -r nomachine -g 433 \
&& useradd -u 431 -r -g nomachine -d /home/nomachine -s /bin/bash -c "NoMachine" nomachine \
&& mkdir /home/nomachine \
&& chown -R nomachine:nomachine /home/nomachine \
&& echo 'nomachine:nomachine' | chpasswd

ADD nxserver.sh /

## Install a desktop, manually start it
RUN apt-get install -y mate-desktop-environment-core xvfb 


EXPOSE 4000

RUN chmod +x /nxserver.sh 

ENTRYPOINT ["/nxserver.sh"]
