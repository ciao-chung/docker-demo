FROM ubuntu:16.04

USER root

RUN apt-get update && \
    apt-get install -y curl && \
    curl https://deb.nodesource.com/setup_6.x > node6.sh && \
    chmod +x node6.sh && bash ./node6.sh && rm node6.sh && \
    apt-get install -y nodejs && nodejs -v && npm -v && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y yarn && yarn --version

# keep ubuntu running(ubuntu will shut down immediately after the run entrypoint command when run in detached mode)
CMD tail -f /dev/null && php -v