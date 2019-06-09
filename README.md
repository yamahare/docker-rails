# docker-rails
rails run at docker

## ラン
1. docker-compose run web bundle exec rails new . --force --database=mysql
## コンテナをビルド
2. docker-compose build
## コンテナの作成＆起動（バックグラウンド）
3. docker-compose up -d

```database.yml
default: &default
  adapter: mysql2
  encoding: utf8
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: root
  password: password
  host: db
  port: 3306

development:
  <<: *default
  database: live-antenna_development

test:
  <<: *default
  database: live-antenna_test
```
