FROM java:8-jdk
# ubuntu:16.04

ENV SERVERPORT="8888" \
    SERVERIP="192.168.178.58" \
    VERSION="4.5.6" \
    SECKEY="xKGrUDCWkxqWeqUGB1huCDUlxQmzZLTY" \
    DEBCONF_NONINTERACTIVE_SEEN="true" \
    DEBIAN_FRONTEND="noninteractive"

WORKDIR /

RUN apt-get update && apt-get -y upgrade && apt-get install -y --force-yes --no-install-recommends apt-utils

# RUN echo "deb http://http.debian.net/debian jessie-backports main" | tee --append /etc/apt/sources.list.d/jessie-backports.list

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y --force-yes wget tzdata nano curl

# RUN apt-get install -y -t jessie-backports openjdk-8-jdk
# RUN update-java-alternatives -s java-1.8.0-openjdk-amd64
# RUN usermod -u 99 nobody && \
#     usermod -g 100 nobody

RUN echo Europe/Berlin > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/habridge
RUN wget https://github.com/bwssytems/ha-bridge/releases/download/v4.1.4/ha-bridge-4.1.4.jar -O /opt/habridge/ha-bridge-4.1.4.jar

WORKDIR /opt/habridge

# ADD src/* ./
# WORKDIR /config
# RUN mkdir /config/startup-config/
# RUN chmod -R 0775 /ha-bridge-scripts && \
#    chmod -R 0776 /config && \
#    chown -R nobody:users /config
# USER nobody
# ENTRYPOINT /ha-bridge-scripts/new_entrypoint

CMD java -jar ha-bridge-4.1.4.jar

