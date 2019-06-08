FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y build-essential mysql-client nodejs
RUN mkdir /live-antenna
WORKDIR /live-antenna
COPY Gemfile /live-antenna/Gemfile
COPY Gemfile.lock /live-antenna/Gemfile.lock
RUN bundle install
COPY . /live-antenna

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
