require_relative '../Privatekey/oauth_twitter'
require 'json'
require 'oauth'

def get_tweet

  id_array = []

  consumer = OAuth::Consumer.new(
    @client.consumer_key,
    @client.consumer_secret,
  )

  uri_ids = "https://api.twitter.com/1.1/followers/ids.json?screen_name=_fuyok&stringify_ids=true"
  #uri_shows = "https://api.twitter.com/1.1/statuses/show/#{tweet_id.to_s}.json"

  endpoint = OAuth::AccessToken.new(consumer, @client.access_token, @client.access_token_secret)
  responce = endpoint.get(uri_ids)
  result = JSON.parse(responce.body)

  result["ids"].each do |id|
    id_array << id
  end

  followids = id_array.join(",")

  options = {
    #follow: followids
   }

  # @client_s.filter(options) do |object|
  #   puts object.id
  #   puts "---------------------------------------------"
  # end

  @client.user_timeline(screen_name: "_fuyok", count: 1).each do |tweet|
    p tweet.text
    @source = tweet.text
    #responce = endpoint.get("https://api.twitter.com/1.1/statuses/show/#{tweet.id.to_s}.json")
    #result = JSON.pretty_generate(JSON.parse(responce.body))
    #puts result
  end
end
