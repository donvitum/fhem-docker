FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y --force-yes && apt-get install -y --force-yes --no-install-recommends apt-utils
RUN apt-get -y --force-yes install ansible python-apt tzdata

RUN echo Europe/Berlin > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

COPY ansible/* /etc/ansible/

RUN ansible-playbook -i "localhost," -c local /etc/ansible/site.yml

RUN apt-get -y remove ansible python-apt;apt-get -y autoremove

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

COPY sites-enabled/000-default.conf /etc/apache2/sites-enabled/000-default.conf
COPY sites-enabled/000-default.conf /etc/apache2/sites-available/000-default.conf

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 80

EXPOSE 443

CMD ["apache2-reverse-proxy"]
