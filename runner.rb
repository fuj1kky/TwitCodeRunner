require_relative '../Privatekey/oauth_twitter'
require_relative 'gettweet'
require 'json'
require 'net/http'

def runner(source)
  if source == "error[NO TEXT]"
    return 0
  else
    uri = URI.parse('http://api.paiza.io/runners/create')
    param = {
      language: :ruby,
      source_code: source,
      api_key: :guest
    }
    #------------------create code------------------
    responce = Net::HTTP.post_form(uri, param)
    create_result = JSON.parse(responce.body)
    cid = create_result["id"]
    sleep(2)

    #------------------show details------------------
    uri2 = URI.parse("http://api.paiza.io/runners/get_details?id=#{cid}&api_key=guest")
    responce = Net::HTTP.get_response(uri2)
    details_result = JSON.parse(responce.body)
    details_result_p = JSON.pretty_generate(JSON.parse(responce.body))
    details_result_p
    @client.update details_result["stdout"]
  end
end