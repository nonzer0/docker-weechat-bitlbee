FROM       ubuntu:xenial
MAINTAINER Florian Klink <flokli@flokli.de>

RUN apt-get update && apt-get install -y \
  weechat weechat-plugins weechat-scripts \
  bitlbee bitlbee-plugin-otr

RUN locale-gen en_US.UTF-8
RUN locale-gen de_DE.UTF-8
RUN ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

ADD bitlbee.conf /etc/bitlbee/bitlbee.conf

ADD run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]
