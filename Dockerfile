FROM node:10

# Create app directory, make it owned by node:node
WORKDIR /usr/src/app
RUN chown node:node /usr/src/app

# Bundle app source, owned by node:node
COPY --chown=node:node . .

# Don't run as root anymore
USER node

# Install app dependencies
RUN npm install

# Run app
ENTRYPOINT ["/bin/sh"]
CMD ["./app-start.sh"]