require_relative '../Privatekey/oauth_twitter'
require_relative 'apifunc'
require 'json'
require 'oauth'

def sourcejoinfirst(tweet_id)
  info = show(tweet_id)
  if info["in_reply_to_status_id_str"].class == String
    finalinfo = show(info["in_reply_to_status_id_str"])
    #puts JSON.pretty_generate(finalinfo)
    source2 = finalinfo["text"]
    # puts source2
    # puts finalinfo["id_str"]
    if finalinfo["in_reply_to_status_id_str"].class == String
      #puts finalinfo["in_reply_to_status_id_str"]
      sourcejoin(source2, finalinfo["id_str"])
    end
  end
end


def sourcejoin(text, id_str)
  source = text
  current_id = id_str
  # puts source
  current_info = show(current_id)

  #puts current_info["in_reply_to_status_id_str"]
  if current_info["in_reply_to_status_id_str"].class == String
    before_id = current_info["in_reply_to_status_id_str"]
    before_info = show(before_id)
    source = before_info["text"] + " " + source
    puts source
    sourcejoin(source, before_id)
  end
  #return source
end

sourcejoinfirst("1192806025742569473")


#memo
#def sum => "1192805647064059906"
#sum() => "1192805853176291334"
#twit => "1192806025742569473"
