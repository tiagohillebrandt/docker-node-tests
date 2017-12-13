FROM ubuntu:xenial

# Install system basics
RUN apt-get update && apt-get install -y \
        git \
        unzip \
        curl \
        subversion

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -; \
    apt-get install -y nodejs

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -; \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list; \
    apt-get update && apt-get install -y yarn

# Workaround: install npm via yarn to address npm#16807
RUN yarn global add npm
