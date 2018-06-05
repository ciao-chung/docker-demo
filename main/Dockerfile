FROM php:7.1-apache

USER root

RUN apt-get update
RUN apt-get install -y curl software-properties-common gnupg
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs && nodejs -v && npm -v
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update
RUN apt-get install -y yarn && yarn --version

# keep ubuntu running(ubuntu will shut down immediately after the run entrypoint command when run in detached mode)
CMD tail -f /dev/null && php -v && node -v && npm -v && yarn -v