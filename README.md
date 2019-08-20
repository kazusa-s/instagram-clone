■自分が苦労した点

bootstrapやCSSでのレイアウト調整に思いの外
時間がかかってしまいました。
また、働きながら課題を進めていたので作業時間の
確保に苦労しました。
ただエンジニアは業務外での勉強が重要だと
思いますので、今回の課題で勉強の習慣がつきました。

■学んだ点
ransackが便利で感動しました。
railsには便利なgemがたくさんあるので他の
gemもどんどん活用していきたいです。

■自慢したい・相談したい点
~自慢したい~
mysqlではありますがローカルのみ
docker環境で起動することができたことです。

~相談したい点~
・Active record が苦手であり、特にアソシエーション
についての理解が浅いと感じていますので何かおすすめな
勉強法や練習問題などがありますか？

■反省点
・techpitで作ったコードに頼ることが多く
もっと自分の力で考えて作る必要があった。
※以前、techpit(https://market.techpit.jp/)で
クローンサイトを作ったことがありました。

・テストを実装できなかったこと。

・レイアウトが不十分なあったこと。

・実装できていない機能やレイアウトが多々あること。
  ・フォロー機能
  ・通知機能
  ・プロフィールの写真のアップロード
  ・自己紹介、ウェブサイト、電話番号、性別の欄
  ・登録した写真の件数表示
  ・投稿した写真が横３列で表示される
   ...etc




---dockerでの起動(macのみ)---

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
