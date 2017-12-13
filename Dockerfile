FROM ubuntu:xenial

# Install system basics
RUN apt-get update && apt-get install -y \
        git \
        unzip \
        curl \
        subversion

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -; \
    apt-get install -y nodejs

# Upgrade npm to latest version
RUN /usr/bin/npm i -g npm

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -; \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list; \
    apt-get update && apt-get install -y yarn
