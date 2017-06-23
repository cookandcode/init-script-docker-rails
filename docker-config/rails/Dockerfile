FROM ruby:2.4
RUN mkdir /var/app
WORKDIR /var/app
COPY Gemfile ./
COPY Gemfile.lock ./
RUN bundle install
