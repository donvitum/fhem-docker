FROM debian:jessie

MAINTAINER Norman Sahl

ENV FHEM_VERSION 5.8
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

# Install dependencies
RUN apt-get update && apt-get upgrade -y --force-yes && apt-get install -y --force-yes --no-install-recommends apt-utils
RUN apt-get -y --force-yes install \
perl \
wget \
git \
apt-transport-https \
sudo \
etherwake \
dfu-programmer \
make \
build-essential \
snmpd \
snmp \
vim \
telnet \
usbutils \
sqlite3

# Install perl packages
RUN apt-get -y --force-yes install \
libavahi-compat-libdnssd-dev \
libalgorithm-merge-perl \
libclass-dbi-mysql-perl \
libclass-isa-perl \
libcommon-sense-perl \
libdatetime-format-strptime-perl \
libdbi-perl \
libdevice-serialport-perl \
libdpkg-perl \
liberror-perl \
libfile-copy-recursive-perl \
libfile-fcntllock-perl \
libio-socket-ip-perl \
libio-socket-ssl-perl \
libjson-perl \
libjson-xs-perl \
libmail-sendmail-perl \
libsocket-perl \
libswitch-perl \
libsys-hostname-long-perl \
libterm-readkey-perl \
libterm-readline-perl-perl \
libwww-perl \
libxml-simple-perl \
libdbd-sqlite3-perl \
libtext-diff-perl

# Install Missing Perl Modules
RUN apt-get install -y --force-yes dh-make-perl
RUN export PERL_MM_USE_DEFAULT=1 && \
    cpan -i Module:Pluggable && \
    cpan -i REST::Client && \
    cpan install Net::WebSocket::Server && \
    cpan install JSON

# Install fhem
RUN echo Europe/Berlin > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN wget https://fhem.de/fhem-${FHEM_VERSION}.deb && dpkg -i fhem-${FHEM_VERSION}.deb
RUN userdel fhem

RUN git clone https://github.com/herrmannj/fronthem
RUN cp ./fronthem/FHEM/* /opt/fhem/FHEM/
RUN cp -r ./fronthem/www/* /opt/fhem/www/
RUN rm -r ./fronthem

RUN git clone https://github.com/knowthelist/fhem-tablet-ui
RUN cp -r ./fhem-tablet-ui/www/tablet/ /opt/fhem/www/
RUN cp ./fhem-tablet-ui/gen_iconsdemo.pl /opt/fhem/www/
RUN cp /opt/fhem/www/tablet/index_empty.html /opt/fhem/www/tablet/index.html 
RUN rm -r ./fhem-tablet-ui

WORKDIR "/opt/fhem"

COPY data/FHEM/controls.txt ./FHEM/controls.txt
COPY data/FHEM/99_myUtils.pm ./FHEM/99_myUtils.pm
COPY data/contrib/dblog/db.conf ./contrib/dblog/db.conf
COPY data/fhem.cfg.example ./fhem.cfg
COPY start.sh ./

EXPOSE 8383 8083 7072

CMD bash /opt/fhem/start.sh
