FROM java:8-jdk
# ubuntu:16.04

ENV SERVERPORT="8888" \
    SERVERIP="192.168.178.81" \
    VERSION="4.5.6" \
    SECKEY="xKGrUDCWkxqWeqUGB1huCDUlxQmzZLTY" \
    DEBCONF_NONINTERACTIVE_SEEN="true" \
    DEBIAN_FRONTEND="noninteractive"

RUN apt-get update && apt-get -y upgrade && apt-get install -y --force-yes --no-install-recommends apt-utils
RUN apt-get install -y --force-yes wget tzdata nano curl netcat

RUN echo Europe/Berlin > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN usermod -u 99 nobody && \
    usermod -g 100 nobody

WORKDIR /ha-bridge-scripts
ADD src/* ./

WORKDIR /config

#RUN URL="https://github.com/bwssytems/ha-bridge" ; \
#    LV=`curl -s $URL/releases/latest |cut -d'v' -f2|cut -d'"' -f1` ; \
#    wget $URL/releases/download/v${LV}/ha-bridge-${LV}.jar -Oha-bridge.jar

RUN wget -q -O ./ha-bridge.jar https://github.com/bwssytems/ha-bridge/releases/download/v"$VERSION"/ha-bridge-"$VERSION".jar

RUN mkdir /config/startup-config/
RUN mkdir /config/data/
RUN chmod -R 0775 /ha-bridge-scripts && \
    chmod -R 0776 /config && \
    chown -R nobody:users /config

USER nobody

ENTRYPOINT /ha-bridge-scripts/new_entrypoint

# CMD java -jar "-Dserver.port=$SERVERPORT -Dsecurity.key=$SECKEY" ha-bridge.jar
