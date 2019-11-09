require_relative '../Privatekey/oauth_twitter'
require_relative 'apifunc'
require 'json'
require 'oauth'

def sourcejoinfirst(tweet_id)
  info = show(tweet_id)
  # puts info["id_str"]
  # puts info["text"]
  # puts info["in_reply_to_status_id_str"].class
  if info["in_reply_to_status_id_str"].class == String
    final_info = show(info["in_reply_to_status_id_str"])
    source2 = final_info["text"]
    if final_info["in_reply_to_status_id_str"].class == String
      sourcejoin(source2, final_info["id_str"])
    else
      return source2
    end
  else
    puts "実行できるファイルがありません"
    return "error[NO TEXT]"
  end
end

def sourcejoin(text, id_str)
  source = text
  current_id = id_str
  current_info = show(current_id)

  if current_info["in_reply_to_status_id_str"].class == String
    before_id = current_info["in_reply_to_status_id_str"]
    before_info = show(before_id)
    source = before_info["text"] + "\n" + source
    if before_info["in_reply_to_status_id_str"].class == String
      sourcejoin(source, before_id)
    else
      return source
    end
  end
end
