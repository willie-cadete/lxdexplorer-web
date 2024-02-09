FROM ruby:2.6-slim
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp

EXPOSE 3000

# Start the main process.
CMD ["rackup", "-o", "0.0.0.0", "-p", "3000", "config.ru"]
