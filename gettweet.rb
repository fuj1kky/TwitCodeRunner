require_relative '../Privatekey/oauth_twitter'
require_relative 'sourcejoin'
require 'json'
require 'oauth'

def get_tweet_ids

  id_array = []


  consumer = OAuth::Consumer.new(
    @client.consumer_key,
    @client.consumer_secret,
  )

  uri_ids = "https://api.twitter.com/1.1/followers/ids.json?screen_name=_fuyok&stringify_ids=true"

  endpoint = OAuth::AccessToken.new(consumer, @client.access_token, @client.access_token_secret)
  responce = endpoint.get(uri_ids)
  result = JSON.parse(responce.body)

  result["ids"].each do |id|
    id_array << id
  end

  followids = id_array.join(",")

  options = {
    #follow: followids
    track: "twitcoderunner"
   }

 end

  #debug
  # @client.user_timeline(screen_name: "_fuyok", count: 5).each do |tweet|
  #   #puts tweet.text
  #   if reg1 =~ tweet.text
  #     responce = endpoint.get("https://api.twitter.com/1.1/statuses/show/#{tweet.id.to_s}.json")
  #     result = JSON.parse(responce.body)
  #     finid = result["id_str"]
  #     @source = sourcejoinfirst(finid)
  #   end
  # end
