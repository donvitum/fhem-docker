FROM toke/mosquitto

WORKDIR /mqtt

RUN mkdir -p config
RUN mkdir -p data
RUN mkdir -p log

ADD config/* ./config

RUN chown -R mosquitto:mosquitto /mqtt

EXPOSE 1883:1883 9001:9001

ADD docker-entrypoint.sh /usr/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/sbin/mosquitto", "-c", "/mqtt/config/mosquitto.conf"]

