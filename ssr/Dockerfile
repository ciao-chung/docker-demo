# docker build --tag ssr . --no-cache
# docker run --name ssr -v /path-to-your-host/ssr.json:/config/ssr.json -p 3000:3000 -d ssr
FROM node:8
MAINTAINER Ciao Chung

RUN apt-get update -y
RUN apt-get install -y fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 && \
  libatspi2.0-0 libgtk-3-0 libnspr4 libnss3 libx11-xcb1 && \
  libxss1 libxtst6 lsb-release xdg-utils; exit 0
RUN apt --fix-broken install -y
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome*.deb; exit 0
RUN apt-get install -f -y
RUN rm -f google-chrome*.deb
RUN google-chrome --version
RUN yarn global add ciao-ssr pm2
RUN echo '{ "allowOrigin": [ "*" ], "host": "0.0.0.0", "launchOptions": { "args" : ["--no-sandbox", "--disable-setuid-sandbox"] }, "cache": { "ttl": 300, "maxsize": 1000 }, "port": 3000 }' > /root/ssr.json

EXPOSE 3000

CMD ["sh", "-c", "pm2 start ciao-ssr --name='ssr' -- --config=/config/ssr.json && tail -f /dev/null"]