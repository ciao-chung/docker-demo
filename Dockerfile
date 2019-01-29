FROM ubuntu:16.04
MAINTAINER Ciao Chung

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y --assume-yes apt-utils
RUN apt-get install -y software-properties-common gnupg
RUN apt-get install -y curl wget vim net-tools
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs \
  && nodejs -v \
  && npm -v
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update
RUN apt-get install -y yarn && yarn --version
RUN yarn global add pm2
RUN apt-get install -y apache2
RUN service apache2 restart

RUN yarn global add ciao-ssr \
  && apt-get install libxss1 libappindicator1 libindicator7 -y \
  && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /root \
  && apt-get update \
RUN dpkg -if /root/google-chrome*.deb
RUN apt-get install -f -y
RUN rm -f /root/google-chrome*.deb \
  && ll /usr/bin/google-chrome \
  && google-chrome --version \
RUN echo '{ "allowOrigin": [ "*" ], "launchOptions": { "args" : ["--no-sandbox", "--disable-setuid-sandbox"] }, "cache": { "ttl": 300, "maxsize": 1000 }, "port": 3000 }' > /root/ssr.json

EXPOSE 3000 80 443 22

CMD tail -f /dev/null && node -v && npm -v && yarn -v && ifconfig