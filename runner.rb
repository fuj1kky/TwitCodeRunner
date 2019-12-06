require_relative '../Privatekey/oauth_twitter'
require_relative 'apifunc'
require 'json'
require 'net/http'

def runner(source,language,screen_name)
  if source == "error[NO TEXT]"
    puts "実行できるファイルがありません"
  elsif language == "none"
    puts "拡張子に対応した言語がありません"
  else
    uri = URI.parse('http://api.paiza.io/runners/create')
    param = {
      language: language,
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
    puts JSON.pretty_generate(details_result)
    if details_result["result"] == "success"
      text = "@#{screen_name}\n" + details_result["stdout"]
    elsif details_result["result"] == "failure"
      text = "@#{screen_name}\n" + details_result["stderr"]
    elsif details_result["result"].nil?
      text = "@#{screen_name}\n" + details_result["build_stderr"]
    else
      text = "@#{screen_name}\n" + "何らかのエラーが発生しました。"
    end
    if text.length > 140
      text = text[0...138] + "..."
    end
    @client.update text
  end
end
