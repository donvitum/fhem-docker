FROM node

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
