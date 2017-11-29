FROM nodered/node-red-docker:0.17.5

USER root

RUN npm install node-red-contrib-azure-iot-hub
RUN npm install node-red-contrib-telegrambot
RUN npm install node-red-contrib-tankerkoenig
RUN npm install node-red-node-weather-underground
RUN npm install node-red-dashboard
RUN npm install node-red-node-fitbit

COPY data/* /data/
COPY data/package.json /usr/src/node-red/package.json

# RUN chown -R node-red:node-red /data
RUN chmod -R 0776 /data && \
    chown -R 1001:1001 /data && \
    chown 1001:1001 /usr/src/node-red/package.json

USER node-red



