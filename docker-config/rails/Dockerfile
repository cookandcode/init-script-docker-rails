FROM ruby:2.4
RUN apt-get update
RUN apt-get install -y nodejs
RUN mkdir /var/app
WORKDIR /var/app
COPY Gemfile ./
COPY Gemfile.lock ./
RUN bundle install
