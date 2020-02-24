FROM ruby:2.7.0

RUN apt-get update -qq && \
  apt-get install -y sudo build-essential libpq-dev vim postgresql-client nodejs

RUN mkdir /app
WORKDIR /app

COPY ./ /app

RUN bundle install

RUN chmod 744 /app/startup.sh
CMD ["/app/startup.sh"]
