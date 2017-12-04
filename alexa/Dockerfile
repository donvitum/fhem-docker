FROM node

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN apt-get update && apt-get -y upgrade && apt-get install -y --force-yes --no-install-recommends apt-utils
RUN apt-get install -y --force-yes wget tzdata nano curl netcat

RUN echo Europe/Berlin > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# Create app directory
WORKDIR /opt/alexa-fhem

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
COPY . .

RUN mkdir /root/.alexa
COPY ./config.json /root/.alexa/

EXPOSE 3000

# CMD [ "npm", "start" ]
CMD /opt/alexa-fhem/bin/alexa
