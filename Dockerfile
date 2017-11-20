FROM  ubuntu:latest
LABEL maintainer="Christian Reiss (email@christian-reiss.de)"
LABEL net.alpha-labs.version="0.1"
LABEL vendor="alpha-labs.net"
LABEL net.alpha-labs.release-date="2017-11-19"
LABEL net.alpha-labs.version.is-production="true"

RUN apt update && apt upgrade -y && apt install -y git apache2 php ffmpeg monit
#RUN cd /var/www/ && rm -rf html && git clone https://github.com/DanielnetoDotCom/YouPHPTube.git && mv YouPHPTube html
RUN cd /var/www/ && rm -rf html && git clone https://github.com/DanielnetoDotCom/YouPHPTube-Encoder.git && mv YouPHPTube-Encoder html

COPY monitrc /etc/monitrc
RUN /bin/chmod 0700 /etc/monitrc

# VOLUME /opt/otrs
EXPOSE 80/tcp

ENTRYPOINT /usr/bin/monit -c /etc/monitrc -I

