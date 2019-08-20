FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
&& apt-get install -y nodejs
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN gem install bundler -v '1.16.6'
RUN bundle install
COPY . /app
