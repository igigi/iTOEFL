class Push
  require 'net/http'
  
  def self.mark_push(message_id) 
    url = URI.parse('http://msg.umeng.com/api/send')
    # Set the request parameters
    message = Message.find(message_id)
    user = message.user
    timestamp = Time.now.to_i
    validation_token_android = Digest::MD5.hexdigest("532fea8456240b89e201da87" + "kvxuokzzowpdexsy3d04wl3d6jdicrbl" + "#{timestamp}")
    validation_token_ios = Digest::MD5.hexdigest("542268affd98c5bd2c0089bb" + "gmi3oyjms15mqk1zinmegbjckgktqgub" + "#{timestamp}")
    
    request_body_android = {
      appkey: "532fea8456240b89e201da87",
      timestamp: "#{timestamp}",
      validation_token: "#{validation_token_android}",
      type: "customizedcast",
      alias: "#{user.open_id}",
      alias_type: "tuofu",
      payload: {
        display_type: "notification",
        body: {
          ticker: "#{message.content}",
          title: "小马托福",
          text: "#{message.content}",
          after_open: "go_custom",
          custom: {
            content_id: "#{message.content_id}",
            content_type: "#{message.content_type}",
            message_id: "#{message.id}"
          }
        }
      }
    }

    request_body_ios = {
      appkey: "542268affd98c5bd2c0089bb",
      timestamp: "#{timestamp}",
      validation_token: "#{validation_token_ios}",
      type: "customizedcast",
      alias: "#{user.open_id}",
      alias_type: "tuofu",
      payload: {
        aps: {alert: "#{message.content}"},
        content_id: "#{message.content_id}",
        content_type: "#{message.content_type}",
        message_id: "#{message.id}"
      },
      production_mode: "false"
    }
    message.push_count += 1
    message.is_readed = false 

    json_headers = {"Content-Type" => "application/json",
                "Accept" => "application/json"}
    http = Net::HTTP.new(url.host, url.port)

    response_android = http.post(url.path, request_body_android.to_json, json_headers)
    response_ios = http.post(url.path, request_body_ios.to_json, json_headers)
    puts response_android.code
    puts response_android.body
    puts response_ios.code
    puts response_ios.body
    puts response_ios.code
    if response_android.code == "200" || response_ios.code == "200"
      message.is_pushed = true
      message.push_at = Time.now
      message.save
    end
  end
end
