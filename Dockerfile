FROM ruby:2.5.0

ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs mysql-client

RUN mkdir /rails_app
WORKDIR /rails_app

ADD Gemfile /rails_app/Gemfile
ADD Gemfile.lock /rails_app/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /rails_app