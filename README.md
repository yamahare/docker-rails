# docker-rails
rails run at docker

## ラン
1. docker-compose run web bundle exec rails new . --force --database=mysql
## コンテナをビルド
2. docker-compose build
## コンテナの作成＆起動（バックグラウンド）
3. docker-compose up -d
## データベースの作成
4. docker-compose run web bundle exec rails db:create 

```database.yml
default: &default
  adapter: mysql2
  charset: utf8mb4
  encoding: utf8mb4
  collation: utf8mb4_general_ci
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: root
  password: password
  host: db
  timeout: 5000

development:
  <<: *default
  database: live-antenna_development

test:
  <<: *default
  database: live-antenna_test
```
