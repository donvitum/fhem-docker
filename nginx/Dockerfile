FROM nginx

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN apt-get update && apt-get -y upgrade && apt-get install -y --force-yes --no-install-recommends apt-utils
RUN apt-get install -y --force-yes wget tzdata nano curl netcat procps

RUN echo Europe/Berlin > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# RUN rm -rf /etc/nginx
# COPY ./conf /etc/nginx
COPY nginx.conf /etc/nginx/
COPY nginx-secure.conf /etc/nginx/

COPY dhparams.pem /etc/nginx/

COPY start.sh /

CMD /start.sh


