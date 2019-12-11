# 概要
Twitterでコードをつぶやくと実行結果が返ってくるようなアプリです。

# 実行
TwitterDeveloperに登録してあれば、つぶやいたコードの実行結果を自らのアカウントからツイートさせることができます。
その場合は、認証情報を記したファイルを置いてから
`ruby tcr-main.rb`
を行うとUserStreamingを開始します。コンシューマーキーやアクセストークンは、Streamingの方も書いておいてください。
```ruby:oauth.rb
require 'twitter'

@client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "aaaaa"
  config.consumer_secret     = "bbbbb"
  config.access_token        = "ccccc"
  config.access_token_secret = "ddddd"
end

@client_s = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "aaaaa"
  config.consumer_secret     = "bbbbb"
  config.access_token        = "ccccc"
  config.access_token_secret = "ddddd"
end
```

# コードを実行するには
実行したいコードを書いたツイートにリプライする形で`twitcoderunner (適当なファイル名).(拡張子)`とツイートします。

# 対応言語・拡張子
一部の言語の拡張子は、Twitter側で自動的にリンクになってしまうのを防ぐために変更しています。

| 対応言語          |拡張子|
|:-----------------|:------------------|
| Bash             |        **.shl**   |
| C                |          .c       |
| c#               |          .cs      |
| C++              |          .cpp     |
| Clojure          |          .clj     |
| COBOL            |          .cob     |
| CoffeeScript     |        **.cfs**   |
| D                |          .d       |
| Elixir           |          .exs     |
| Erlang           |          .erl     |
| F#               |          .fs      |
| Go               |          .go      |
| Haskell          |          .hs      |
| Java             |        **.jv**    |
| JavaScript       |          .js      |
| Kotlin           |          .kt      |
| MySQL            |          .sql     |
| Perl             |        **.prl**   |
| PHP              |          .php     |
| python2          |        **.py2**   |
| python3          |        **.py3**   |
| R                |          .R       |
| Ruby             |          .rb      |
| Rust             |        **.rst**   |
| scala            |          .scara   |
| Scheme           |          .scm     |
| Swift            |          .swift   |
| VB               |          .vb      |
 
 #その他機能
 コードが２ツイート以上に及ぶ場合は、それらのツイートをリプライによって繋げてください。
 
 #注意
 - インスタンス変数などで「@~」を使う場合は、それが誰かのTwitterIDになる可能性があることに注意してください。
 - `.new`など一部のドットがつくような表現はTwitter側が自動的にリンクにしてしまうため、コードとして表現できない・コンパイルが通らないことがあります。
 - まだまだバグがたくさんありそうです。使うときは自己責任でお願いします。
