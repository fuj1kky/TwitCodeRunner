require_relative '../Privatekey/oauth_twitter'
require_relative 'gettweet'
require_relative 'runner'
require 'json'
require 'net/http'

consumer = OAuth::Consumer.new(
  @client.consumer_key,
  @client.consumer_secret,
)
endpoint = OAuth::AccessToken.new(consumer, @client.access_token, @client.access_token_secret)

filter_option = get_tweet_ids

reg1 = /twitcoderunner (.*)\.(.*)/

@client_s.filter(filter_option) do |object|
  puts object.text
  if reg1 =~ object.text
    responce = endpoint.get("https://api.twitter.com/1.1/statuses/show/#{object.id.to_s}.json")
    result = JSON.parse(responce.body)
    finid = result["id_str"]
    source = sourcejoinfirst(finid)
    runner(source)
  end
  puts "---------------------------------------------"
end

# debug
# @client.user_timeline(screen_name: "_fuyok", count: 5).each do |tweet|
#   #puts tweet.text
#   if reg1 =~ tweet.text
#     puts tweet.text
#     responce = endpoint.get("https://api.twitter.com/1.1/statuses/show/#{tweet.id.to_s}.json")
#     result = JSON.parse(responce.body)
#     finid = result["id_str"]
#     puts finid
#     source = sourcejoinfirst(finid)
#     puts source
#     runner(source)
#   end
# end
