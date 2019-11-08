require_relative '../Privatekey/oauth_twitter'
require 'json'
require 'oauth'

consumer = OAuth::Consumer.new(
  @client.consumer_key,
  @client.consumer_secret,
)

uri = "https://api.twitter.com/1.1/followers/ids.json?screen_name=_fuyok&stringify_ids=true&count=5"
endpoint = OAuth::AccessToken.new(consumer, @client.access_token, @client.access_token_secret)
responce = endpoint.get(uri)
result = JSON.pretty_generate(JSON.parse(responce.body))
puts result
