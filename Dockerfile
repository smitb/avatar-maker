FROM node:16-bookworm-slim

# make the 'app' folder the current working directory
WORKDIR /app

RUN apt-get update && apt-get install -y python3 libssl-dev

# copy both 'package.json' and 'package-lock.json' (if available)
COPY package*.json vue.config.js ./

# install project dependencies
RUN npm ci

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . .

# build app for production with minification
RUN npm run build

EXPOSE 8080
CMD [ "npm", "run", "serve" ]
