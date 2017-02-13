FROM debian:jessie
RUN  apt-get update && apt-get install -y \
     git \
     vim \
     nginx \
     curl

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs
RUN npm install pm2 -g
