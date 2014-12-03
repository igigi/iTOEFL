class Push
  require 'net/http'
  
  def self.mark_push(message_id) 
    url = URI.parse('http://msg.umeng.com/api/send')
    # Set the request parameters
    message = Message.find(message_id)
    user = message.user
    #host = 'http://msg.umeng.com/api/send'
    appkey = "532fea8456240b89e201da87"
    timestamp = Time.now.to_i
    validation_token = Digest::MD5.hexdigest("532fea8456240b89e201da87" + "kvxuokzzowpdexsy3d04wl3d6jdicrbl" + "#{timestamp}")
    
    request_body_map = {
      appkey: "532fea8456240b89e201da87",
      timestamp: "#{timestamp}",
      validation_token: "#{validation_token}",
      type: "customizedcast",
      alias: "#{user.open_id}",
      alias_type: "tuofu",
      payload: {
        display_type: "notification",
        body: {
          ticker: "发送消息描述",
          title: "发送消息描述",
          text: "发送消息描述",
          after_open: "go_custom",
          custom: {
            content: "jdkfdfkll",
            content_type: "dfdfdf"
          }
        }
      }
    }
    message.push_count += 1
    message.is_readed = false 

    json_headers = {"Content-Type" => "application/json",
                "Accept" => "application/json"}
    http = Net::HTTP.new(url.host, url.port)

    response = http.post(url.path, request_body_map.to_json, json_headers)
    puts response.code
    if response.code == "200"
      message.is_pushed = true
      message.save
    end
  end
end
