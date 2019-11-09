require_relative '../Privatekey/oauth_twitter'
require 'json'
require 'oauth'

def show(tweet_id)
  consumer = OAuth::Consumer.new(
    @client.consumer_key,
    @client.consumer_secret,
  )
  endpoint = OAuth::AccessToken.new(consumer, @client.access_token, @client.access_token_secret)
  responce = endpoint.get("https://api.twitter.com/1.1/statuses/show/#{tweet_id.to_s}.json")
  result = JSON.parse(responce.body)

  return result
end

def uselang(extention)
  num = 0
  language = ""
  ext_array = ["sh", "c", "cs", "cpp", "clj", "cob", "coffee", "d", "exs", "erl", "fs",
               "go", "hs", "java", "js", "kt", "sql", "pl", "php", "py", "pyth",
               "R", "rb", "rs", "scala", "scm", "swift", "vb"]

  lang_array = [:bash, :c, :csharp, :cpp, :clojure, :cobol, :coffeescript, :d,
                :elixir, :erlang, :fsharp, :go, :haskell, :java, :javascript,
                :kotlin, :mysql, :perl, :php, :python, :python,
                :r, :ruby, :rust, :scala, :scheme, :swift, :vb]

  ext_array.each do |ext|
    if extention == ext
      language = lang_array[num]
      return language
    end
    num = num + 1
  end
end
