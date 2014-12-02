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
      alias: "hjhjhj",
      alias_type: "tuofu",
      payload: {
        display_type: "notification",
        body: {
          ticker: "发送消息描述",
          title: "发送消息描述",
          text: "发送消息描述",
          after_open: "go_activity"
          },
        extra: {
          key1: "value1",
          key2: "value2"
        }
      }
    }.to_json
    message.push_count += 1
    message.is_readed = false 
    Net::HTTP.start(url.host, url.port) do |http|
      req = Net::HTTP::Post.new(url.path)
      req.set_form_data(request_body_map)
      puts http.request(req).body
      puts http.request(req).code
      if http.request(req).code == "200"
        message.is_pushed = true
        message.save
      end
    end
  end
end
