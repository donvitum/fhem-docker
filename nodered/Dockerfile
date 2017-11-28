FROM nodered/node-red-docker

RUN npm install node-red-node-wordpos
RUN npm install node-red-contrib-azure-iot-hub
RUN npm install node-red-contrib-telegrambot
RUN npm install node-red-contrib-tankerkoenig
RUN npm install node-red-node-weather-underground
RUN npm install node-red-dashboard
RUN npm install node-red-node-fitbit

WORKDIR /data
ADD data/* ./

# RUN npm install node-red-contrib-alexa-local

CMD ["/usr/local/bin/npm","start","node-red"]
