require_relative '../Privatekey/oauth_twitter'
require_relative 'runner'
require_relative 'apifunc'
require_relative 'sourcejoin'
require 'json'
require 'net/http'

consumer = OAuth::Consumer.new(
  @client.consumer_key,
  @client.consumer_secret,
)
endpoint = OAuth::AccessToken.new(consumer, @client.access_token, @client.access_token_secret)

filter_option = {
  track: "twitcoderunner"
 }

reg1 = /\Atwitcoderunner (.*)\.(.*)\Z/

@client_s.filter(filter_option) do |object|
  puts object.text
  if reg1 =~ object.text
    lang = uselang($2)
    responce = endpoint.get("https://api.twitter.com/1.1/statuses/show/#{object.id.to_s}.json")
    result = JSON.parse(responce.body)
    finid = result["id_str"]
    name = result["in_reply_to_screen_name"]
    sourcetext = sourcejoinfirst(finid)
    source = charrefconversion(sourcetext)
    runner(source, lang, name)
  end
  puts "---------------------------------------------"
end

# debug
# @client.user_timeline(screen_name: "fuyok_", count: 5).each do |tweet|
#   #puts tweet.text
#   if reg1 =~ tweet.text
#     puts tweet.text
#     language = uselang($2)
#     puts language
#     responce = endpoint.get("https://api.twitter.com/1.1/statuses/show/#{tweet.id.to_s}.json")
#     result = JSON.parse(responce.body)
#     finid = result["id_str"]
#     puts finid
#     source = sourcejoinfirst(finid)
#     puts source
#     name = result["in_reply_to_screen_name"]
#     puts name
#     puts
#     #runner(source,language,name)
#   end
# end
