FROM debian:jessie
RUN  apt-get update && apt-get install -y \
     git \
     vim \
     nginx \
     curl

# RUN rm -r /etc/nginx/sites-enabled/default
# RUN rm -r /var/www/html
# COPY default etc/nginx/sites-enabled/
WORKDIR /var/www
COPY files/ /var/www
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs
RUN npm install pm2 -g
RUN cd /var/www; npm install
RUN service nginx restart

EXPOSE 80
RUN groupadd -r nodejs \
    && useradd -m -r -g nodejs nodejs
USER nodejs
# CMD ["npm", "start"]
RUN pm2 start app.js 
