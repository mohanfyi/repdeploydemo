FROM    node:0.10-slim
# Install Node.js and npm
#RUN     yum install -y npm
# Bundle app source
COPY . /src
# Install app dependencies
RUN cd /src; npm install
EXPOSE  8080
CMD ["node", "/src/server.js"]
