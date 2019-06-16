FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev

# yarnパッケージ管理ツールインストール
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

# Node.jsをインストール
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install nodejs

RUN mkdir /live-antenna
WORKDIR /live-antenna
COPY Gemfile /live-antenna/Gemfile
COPY Gemfile.lock /live-antenna/Gemfile.lock
RUN gem install bundler
COPY . /live-antenna

# Add a script to be executed every time the container starts.
COPY ./entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
