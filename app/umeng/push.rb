class Push
  
  def self.mark_push(message_id) 
    # Set the request parameters
    message = Message.find(message_id)
    user = message.user
    host = 'http://msg.umeng.com/api/send'
    appkey = "532fea8456240b89e201da87"
    timestamp = Time.now.strftime "%Y%m%d%H%M%S"
    validation_token = Digest::MD5.hexdigest("532fea8456240b89e201da87" + "kvxuokzzowpdexsy3d04wl3d6jdicrbl" + "#{timestamp}")
    
    request_body_map = {
      appkey: "appkey",
      timestamp: "timestamp",
      validation_token: "validation_token",
      type: "customizedcast",
      alias: "dfdsfsdf",
      payload:
      {
          display_type: "notification",
          body: 
          {
            ticker: "xx",
            title: "xx",
            text: "xx",
            after_open: "go_activity"
          },
          extra: {
            key1: "value1",
            key2: "value2"
          }    
      },
      description: "测试customizedcast消息"
    }
    message.push_count += 1
    message.is_readed = false

    response = RestClient.post(
      "http://msg.umeng.com/api/send",
      request_body_map.to_json,
      {
        content_type: 'application/json',
        accept: 'application/json'
      }
    )
    if response.code == 200
      message.is_pushed = true
    else
      raise "error"
    end
      puts "#{response.to_str}"
      puts "Response status: #{response.code}"
      response.headers.each { |k,v|
        puts "Header: #{k}=#{v}"
      }
  end
end
