FROM ruby:2.5.1

ENV LANG C.UTF-8

# Install essential libraries
RUN apt-get update && apt-get install -y build-essential libpq-dev

# install node
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash - && apt-get install nodejs

# Install yarn
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

# Fix: 'Cannot find module 'node-sass'
RUN yarn add node-sass

RUN gem install bundler

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --jobs=10

ARG DATABASE_URL
ENV DATABASE_URL ${DATABASE_URL}

ARG APP_HOME
ENV APP_HOME ${APP_HOME}

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY . $APP_HOME
