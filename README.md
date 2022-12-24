--dockerでの起動(macのみ)---

①database.ymlを以下のように編集
```ruby
development:
  # <<: *default    #コメントアウトする

  #mysql
  <!-- 下記のコードのコメントアウトを解除 -->
  adapter: mysql2
  encoding: utf8
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: root
  password: password
  host: db
    <!-- 上記のコードのコメントアウトを解除 -->
  (~略)

  test:
    # <<: *default    #コメントアウトする

    #mysql
    <!-- 下記のコードのコメントアウトを解除 -->
    adapter: mysql2
    encoding: utf8
    pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
    username: root
    password: password
    host: db
    <!-- 下記のコードのコメントアウトを解除 -->
  ```

② ターミナルで以下のコマンドを実行

   1. docker-compose build

   2. docker-compose run web rails db:create

   3. docker-compose run web rails db:migrate

   4. docker-compose up
