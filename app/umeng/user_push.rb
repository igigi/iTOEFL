class Push
  
  def self.mark_push(message_id) 
    # Set the request parameters
    message = Message.find(message_id)
    host = 'http://msg.umeng.com/api/send'
    appkey = "532fea8456240b89e201da87"
    timestamp = Time.now.strftime "%Y%m%d%H%M%S"
    validation_token = Digest::MD5.hexdigest("532fea8456240b89e201da87" + "kvxuokzzowpdexsy3d04wl3d6jdicrbl" + "#{timestamp}")
    
    request_body_map = {
      "appkey": appkey,
      "timestamp": timestamp,
      "validation_token": validation_token,
      "type":"customizedcast",
      "alias":"xx",
      "payload":
      {
          "display_type": "message", // 消息，message
          "body":
          {
             "custom":"自定义custom" // message只需要填写custom即可，可以是字符串或者JSON。
          }    
      },
      "description":"测试customizedcast消息"
    }
    
    begin
      message.push_count + = 1
      message.is_pushed = false
      response = RestClient::Request.execute(
        method: post,
        url: "#{host}",
        timeout: 10,
        open_timeout: 10,
        payload: request_body_map.to_json,    # Encode the entire body as JSON
        headers: {
          content_type: 'application/json',
          accept: 'application/json'
        }
        )
      if response.code == 200
        message.is_pushed = true
      end
      #puts "#{response.to_str}"
      #puts "Response status: #{response.code}"
      #response.headers.each { |k,v|
      #  puts "Header: #{k}=#{v}"
      #}
    
    rescue => e
      puts "ERROR: #{e}"
    end
  end
end
