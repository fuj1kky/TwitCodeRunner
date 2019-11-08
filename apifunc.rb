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
