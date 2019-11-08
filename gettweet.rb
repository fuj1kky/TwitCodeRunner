require_relative '../Privatekey/oauth_twitter'
require 'json'
require 'oauth'
require 'net/http'


id_array = []

consumer = OAuth::Consumer.new(
  @client.consumer_key,
  @client.consumer_secret,
)


uri = "https://api.twitter.com/1.1/followers/ids.json?screen_name=_fuyok&stringify_ids=true"
endpoint = OAuth::AccessToken.new(consumer, @client.access_token, @client.access_token_secret)
responce = endpoint.get(uri)
result = JSON.parse(responce.body)

result["ids"].each do |id|
  id_array << id
end

followids = id_array.join(",")

options = {
  follow: followids
 }

@client_s.filter(options) do |object|
  puts object.text
  puts "---------------------------------------------"
end
