require_relative '../Privatekey/oauth_twitter'
require_relative 'sourcejoin'
require 'json'
require 'oauth'

def get_tweet

  consumer = OAuth::Consumer.new(
    @client.consumer_key,
    @client.consumer_secret,
  )

  options = {
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
