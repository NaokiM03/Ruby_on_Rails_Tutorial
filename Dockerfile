FROM ruby:2.5.0

ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs mysql-client

WORKDIR /rails_app

RUN gem install bundler

ADD Gemfile .
ADD Gemfile.lock .

RUN bundle install --jobs=4

ADD . /rails_app
