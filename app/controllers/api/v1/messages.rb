module API
  module V1
    class Messages < Grape::API
      include API::V1::Defaults

      resource :messages do
        # 获取消息列表数据
        desc "get my messages", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :page, type: String, desc: "page number"
          optional :from, type: String, desc: "filter condition, web requires; pc:pc"
        end
        get "" do
          authenticate!
          is_readed = [false, true]
          is_readed.push(nil) if params[:from] == 'pc'
          Message.where(user_id: current_user.id, is_readed: is_readed).order(is_readed: :asc, created_at: :desc).paginate(page: params[:page], per_page: 20)
        end

        # 读取未读消息
        desc "get my unread messages", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        # params do
        #   requires :page, type: String, desc: "page number"
        # end
        get "unread" do
          authenticate!
          unread = Message.where(user_id: current_user.id, is_readed: [false, nil]).count
          {unread: unread}
        end

        # 回写已读状态
        desc "set message as read.", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :id, type: Integer, desc: "ID of message"
        end
        post ":id/set_message_as_read" do
          authenticate!
          message = Message.where(user_id: current_user.id, id: params[:id]).where.not(is_readed: true).first
          if message
            message.update(is_readed: true)
            status 204
          else
            status 200
            {error: "not found unread message for this id"}
          end
        end
      end
    end
  end
end
