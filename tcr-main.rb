require_relative '../Privatekey/oauth_twitter'
require 'json'
require 'net/http'

SOURCE = "puts 'hello,world!' "
uri = URI.parse('http://api.paiza.io/runners/create')
param = {
  language: :ruby,
  source_code: SOURCE,
  api_key: :guest
}

responce = Net::HTTP.post_form(uri, param)

puts JSON.parse(responce.body)
