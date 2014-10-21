module API
  module V1
    class Favorites < Grape::API
      include API::V1::Defaults

      namespace :favorites do

        desc "Create a discussion favorite."
        params do
          requires :user_id, type: Integer, desc: "ID of user"
          optional :discussion_id, type: Integer, desc: "ID of discussion"
          optional :opinion_id, type: Integer, desc: "ID of opinion"
        end
        post do
          if params[:discussion_id]
            #authenticate!
            Discussion.find(params[:discussion_id]).liked_by User.find(params[:user_id])
            nil
          elsif params[:opinion_id]
            #authenticate!
            Opinion.find(params[:opinion_id]).liked_by User.find(params[:user_id])
            nil
          end
        end
      end
    end
  end
end